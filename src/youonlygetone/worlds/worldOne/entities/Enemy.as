package youonlygetone.worlds.worldOne.entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import youonlygetone.worlds.common.Bang;
	/**
	 * ...
	 * @author SmirnovAM
	 */
	public class Enemy extends Entity
	{
		[Embed(source = '../../../../../assets/enemy.png')] private const sprite:Class;
		
		private var maxSpeed:Number = 3;		
		private var accelerationJump:Number = 3.5;
		private var accelerationX:Number = 0.5;
		private var accelerationY:Number = 0.1;
		private var slowdownX:Number = 0.1;
		private var friction: Number = 2.0;
		private var speedX:Number = 0;
		private var speedY:Number = 0;
		private var moveAllowed:Boolean = true;
		private var timeFromSpeach:Number = 0;
		
		public function Enemy(x:int, y:int)
		{
			this.x = x;
			this.y = y;
			
			name = "enemy";
			
			graphic = new Spritemap(sprite, 16, 27);
			(graphic as Spritemap).add("go", [0, 1, 2, 3, 4], 8, true);

			if (Math.random() < 0.5) {
				(graphic as Spritemap).flipped = false;
				speedX = -8;
			} else {
				(graphic as Spritemap).flipped = true;
				speedX = 8;
			}
			
			(graphic as Spritemap).play("go");
			setHitbox(16, 27);
			type = "enemy";
		}
		
		override public function update():void
		{
			if (!moveAllowed) {
				return;
			}
			
			var weapon:* =  collide("weapon", x, y);
			if (weapon && weapon.visible)
			{
				FP.world.add(new Bang(x, y));
				FP.world.remove(this);
			}
			if (collide("platform", x, y))
			{
				if (Input.pressed("Jump"))
				{
			//		speedY = -accelerationJump;
				} else {
					y -= speedY;
					speedY = 0;
				}
				
				if (!collide("platform", x - speedX, y + Math.abs(speedX))) {
					(graphic as Spritemap).flipped = !(graphic as Spritemap).flipped;
					speedX = -speedX;
				}
			}			
			speedY += accelerationY;
			y += speedY;
			if ( y > 600) { 
				FP.world.remove(this);
			}
			
			x -= speedX * FP.elapsed;
			
			timeFromSpeach += FP.elapsed;
			if (Math.random() < 0.005) {
				if (timeFromSpeach > 3) {
					timeFromSpeach = 0;
					FP.world.add(new AliensSpeech(x + halfWidth, y, "Help us!"));
				}
			}
		}
		
		public function allowMove():void 
		{
			moveAllowed = true;
		}
	}
}