package youonlygetone.worlds.worldOne.entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import youonlygetone.Skills;
	import youonlygetone.worlds.common.Bang;
	/**
	 * ...
	 * @author SmirnovAM
	 */
	public class Fire extends Entity
	{
		[Embed(source = '../../../../../assets/fire.png')] private const image:Class;
		
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
		private var countHint:int = 0;
		private var blinkCount:int = 0;
		private var flyToLeft:Boolean = true;
		private var startMove:Boolean = false;
		
		public function Fire(x:int, y:int, angle:Number)
		{
			this.x = x;
			this.y = y;
			
			name = "boss";
			
			graphic = new Image(image);
			setHitbox(24, 24);
			
			speedX = -100 * Math.cos(angle);
			speedY = -100 * Math.sin(angle);

			type = "enemy";
		}
		
		override public function update():void
		{
			var b:* = FP.world.getInstance("boss");
			if (b) {
				if (distanceFrom(b) > 2000) {				
					FP.world.remove(this);
				}
			}
			x += speedX * FP.elapsed;
			y += speedY * FP.elapsed;
			
		}
		
		public function allowMove():void 
		{
			moveAllowed = true;
		}
	}
}