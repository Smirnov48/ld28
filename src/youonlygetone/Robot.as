package youonlygetone
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.World;
	import youonlygetone.worlds.worldOne.entities.Enemy;
	import youonlygetone.worlds.worldTwo.Electro;
	import youonlygetone.worlds.worldTwo.ElectroDown;
	
	public class Robot extends Entity
	{
		[Embed(source = '../../assets/robotstand.png')] private const robot:Class;
		
		private var maxSpeed:Number = 3;		
		private var accelerationJump:Number = 3.5;
		private var accelerationX:Number = 0.5;
		private var accelerationY:Number = 0.1;
		private var slowdownX:Number = 0.1;
		private var friction: Number = 2.0;
		private var speedX:Number = 0;
		private var speedY:Number = 0;
		private var moveAllowed:Boolean = false;
		private var blinkCount:int = 0;
		private var died:Boolean = false;
		private var flying:Boolean = false;
		private var doubleJumpAllowed:Boolean = false;
		private var didSecondJump:Boolean = false;
		private var electro:Electro;
		private var timeFromElectro:Number = 0;
		private var timeFromLastDown:Number = 0;
		private var electroDown:ElectroDown;
		
		public function Robot(world:World, x:int, y:int)
		{
			this.x = x;
			this.y = y;
			
			name = "robot";
			
			graphic = new Image(robot);
			
			Input.define("Jump", Key.UP);
			
			setHitbox(22, 23, -4, -10);
			
			electro = new Electro(x - 7, y - 14);
			world.add(electro);
			electro.visible = false;
			
			electroDown = new ElectroDown(x - 7, y + 14);
			world.add(electroDown);
			electroDown.visible = false;
		}
		
		override public function update():void
		{
			if (!moveAllowed) {
				return;
			}
			
			if (flying) {
				if (Input.check(Key.LEFT)) { 
					x -= 100 * FP.elapsed;
				}	
				if (Input.check(Key.RIGHT)) { 
					x += 100 * FP.elapsed;
				}
				if (Input.check(Key.UP)) { 
					y -= 100 * FP.elapsed;
				}
				if (Input.check(Key.DOWN)) {
					y += 100 * FP.elapsed;
				}
				return;
			}
			
			if (died) {
				speedY += accelerationY;
				speedX = speedX * 0.95;
				x += speedX;
				y += speedY;
				return;
			}
			
			electro.x = x - 7;
			electro.y = y - 14;
			electroDown.x = x - 8;
			electroDown.y = y + 20;
			if (Skills.allowWeapon && Input.pressed(Key.SPACE)) {
				electro.visible = true;
				timeFromElectro = 0;
			} else {
				timeFromElectro += FP.elapsed
				if (timeFromElectro > Math.random() * 0.2 + 0.1) {
					electro.visible = false;
				}
			}
			
			var mod:* = collide("mod", x, y);
			if (mod) {
				mod.apply();
			}
			
			var enemy:Enemy = collide("enemy", x, y) as Enemy;
			if (enemy && blinkCount <= 0 && !Skills.understandAliens) {
				blinkCount = 60;
				var angle:Number = Math.atan2(enemy.y - y, enemy.x - x);
				speedX = -3 * Math.cos(angle);
				speedY = -(Math.min(20 * Math.abs(Math.sin(angle)), 2) + 1);
				x -= speedX;
				y += speedY;
				LiveCounter.lives--;
				return;
			}
			if (blinkCount > 0) {
				blinkCount--;
				if (blinkCount % 4 == 0) {
					(graphic as Image).color = 0xFF0000;
				} else {	
					(graphic as Image).color = 0xFFFFFF;
				}
			} 
			if (blinkCount == 0) {
				(graphic as Image).color = 0xFFFFFF;	
			}
			
			if (collide("platform", x, y)) {
				didSecondJump = false;
				if (Input.pressed("Jump")) {
					speedY = -accelerationJump;
				} else {
					if (collide("platform", x, y - 5)) {
						x -= speedX * 2;
						speedX = 0;
					}
					y -= speedY;
					speedY = 0;
				}
			} else {
				if (Skills.doubleJump && Input.pressed("Jump") && !didSecondJump) {
					didSecondJump = true;
					speedY = -accelerationJump;
				}
				if (Input.check(Key.DOWN) && electro.visible && !electroDown.visible && Skills.jumpDown) {
					timeFromLastDown = 0;
					speedY = accelerationJump * 2;
					electroDown.visible = true;
				}
			}
			timeFromLastDown += FP.elapsed;
			if (timeFromLastDown > 0.5) { 
				electroDown.visible = false;
			}
			
			
			speedY += accelerationY;
			y += speedY;
			if (y > 310) {
				LiveCounter.lives = 0;
			}
			//FP.elapsed;
			if (!Input.check(Key.RIGHT) && !Input.check(Key.LEFT)) {
				if (Math.abs(speedX) <= slowdownX) {
					speedX = 0;
				} else {
					if (speedX > 0) {
						speedX -= slowdownX;
					} else if (speedX < 0) {
						speedX += slowdownX;
					}
				}
				x += speedX;
			} else {
				if (Input.check(Key.LEFT)) { 
					speedX -= accelerationX; 
					if (speedX < -maxSpeed) {
						speedX = -maxSpeed;
					}
				}
				if (Input.check(Key.RIGHT)) { 
					speedX += accelerationX; 
					if (speedX > maxSpeed) {
						speedX = maxSpeed;
					}
				}
				x += speedX;
			}
		}
		
		public function allowMove():void 
		{
			moveAllowed = true;
		}
		
		public function die():void 
		{
			died = true;
			(graphic as Image).scaleX = 1.1;
			(graphic as Image).scaleY = 1.1;
		}
		
		public function fly():void 
		{
			flying = true;
		}
		
		public function setVelocity(x:Number, y:Number):void 
		{
			speedX = x;
			speedY = y;
		}
		
		public function allowDoubleJump():void 
		{
			Skills.doubleJump = true;
		}
		
	}
}