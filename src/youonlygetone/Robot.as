package youonlygetone
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
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
		
		public function Robot(x:int, y:int)
		{
			this.x = x;
			this.y = y;
			
			name = "robot";
			
			graphic = new Image(robot);
			
			Input.define("Jump", Key.SPACE, Key.UP);
			
			setHitbox(16, 33);
		}
		
		override public function update():void
		{
			if (!moveAllowed) {
				return;
			}
			if (collide("platform", x, y))
			{
				if (Input.pressed("Jump"))
				{
					speedY = -accelerationJump;
				} else {
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