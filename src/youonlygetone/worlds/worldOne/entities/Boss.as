package youonlygetone.worlds.worldOne.entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import youonlygetone.Skills;
	import youonlygetone.worlds.common.Bang;
	import youonlygetone.worlds.worldTwo.YouWinWorld;
	/**
	 * ...
	 * @author SmirnovAM
	 */
	public class Boss extends Entity
	{
		[Embed(source = '../../../../../assets/boss.png')] private const image:Class;
		
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
		
		public function Boss(x:int, y:int)
		{
			this.x = x;
			this.y = y;
			
			name = "boss";
			
			graphic = new Image(image);
			setHitbox(100, 60);
			speedX = -10;

			type = "enemy";
		}
		
		override public function update():void
		{
			if (!startMove) {
				var p:* = FP.world.getInstance("robot");
				if (p) {
					startMove = p.x > 1900;
				}
				return;
			}
			if (!moveAllowed) {
				return;
			}
			
			var weapon:* =  collide("weapon", x, y);
			if (weapon && blinkCount <= 0  && weapon.visible)
			{
				countHint++;
				blinkCount = 30;
				if (countHint > 60) {				
					FP.world.add(new Bang(x, y));
					FP.world.remove(this);
					FP.world = new YouWinWorld();
				}
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
/*
			var player = FP.world.getInstance("robot");
			if (distanceFrom(player) < 1000) {
				speedX = -Math.min( -5, Math.max(5, player.x - x / 2));
				speedY = -Math.min( -5, Math.max(5, player.y - y / 2));
			}
			*/
			if (x < 1000 && flyToLeft) {
				flyToLeft = false;
				speedX = 10;
			}
			if (x > 2100 && !flyToLeft) {
				flyToLeft = true;
				speedX = -10;
			}
			speedY = 0;
//			speedY += accelerationY;
			x += speedX * FP.elapsed;
			y += speedY * FP.elapsed;
			
			timeFromSpeach += FP.elapsed;
			if (Math.random() < 0.02) {
				FP.world.add(new Fire(x,y, Math.random() * 2 * Math.PI));
			}

			if (Math.random() < 0.005) {
				if (timeFromSpeach > 3) {
					timeFromSpeach = 0;
					FP.world.add(new AliensSpeech(x + halfWidth, y, "I kill you!"));
				}
			}
		}
		
		public function allowMove():void 
		{
			moveAllowed = true;
		}
	}
}