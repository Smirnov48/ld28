package youonlygetone
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import youonlygetone.worlds.worldOne.entities.Enemy;
	
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
		
		public function Robot(x:int, y:int)
		{
			this.x = x;
			this.y = y;
			
			name = "robot";
			
			graphic = new Image(robot);
			
			Input.define("Jump", Key.SPACE, Key.UP);
			
			setHitbox(22, 33, -4, 0);
		}
		
		override public function update():void
		{
			if (!moveAllowed) {
				return;
			}
			
			var enemy:Enemy = collide("enemy", x, y) as Enemy;
			if (enemy && blinkCount <= 0) {
				blinkCount = 60;
				var angle:Number = Math.atan2(enemy.y - y, enemy.x - x);
				speedX = -3 * Math.cos(angle);
				speedY = -(Math.min(20 * Math.abs(Math.sin(angle)), 2) + 1);
				x -= speedX;
				y += speedY;
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

			
			if (collide("platform", x, y))
			{
				if (Input.pressed("Jump"))
				{
					speedY = -accelerationJump;
				} else {
					if (collide("platform", x, y - 5)) {
						x -= speedX * 2;
						speedX = 0;
					}
					y -= speedY;
					speedY = 0;
				}
			}			
			speedY += accelerationY;
			y += speedY;
			if ( y > FP.height + 64) { 
				y = - FP.height - 64;
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
			
			if (x > 200) {
				x = -15 ;
			}
			if (x < -16) {
				x = -16 ;
			}
		}
		
		public function allowMove():void 
		{
			moveAllowed = true;
		}
		
	}
}