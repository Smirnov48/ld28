package youonlygetone.worlds
{
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.World;
	import youonlygetone.LiveCounter;
	import youonlygetone.Robot;
	import youonlygetone.worlds.common.ScreenBorder;
	import youonlygetone.worlds.worldOne.entities.Enemy;
	import youonlygetone.worlds.worldOne.entities.SkipButton;
	import youonlygetone.worlds.worldOne.entities.Splash;
	import youonlygetone.worlds.worldOne.entities.TextForPlayer;
	import youonlygetone.worlds.worldOne.entities.TextForShing;
	import youonlygetone.worlds.worldOne.entities.Background;
	import youonlygetone.worlds.worldOne.entities.Platform;
	import youonlygetone.worlds.worldOne.entities.Shining;
	import youonlygetone.worlds.worldOne.entities.SnowFlake;
	import youonlygetone.worlds.worldOne.entities.TutorialText;
	import youonlygetone.worlds.common.TryAgainText;
	import youonlygetone.worlds.worldTwo.DoubleJumpMod;
	import youonlygetone.worlds.worldTwo.LongBackground;
	import youonlygetone.worlds.worldTwo.WeaponMod;
	
	public class WorldTwo extends World
	{
		private var time:Number = 0;
		
		private var wasSplash:Boolean = false;
		private var wasShine:Boolean = false;
		private var wasTextOnShine:Boolean = false;
		private var wasRemoveShine:Boolean = false;
		private var player:Robot;
		private var skipButton:SkipButton;
		private var wasIntroEnded:Boolean = false;
		
		private var restartCount:Number = -1;
		
		public function WorldTwo()
		{
			super();
			add(new LongBackground());

			add(new Platform(350, 270));
			add(new Platform(380, 250));
			
			add(new Platform(512, 230));
			add(new Platform(544, 230));
			add(new Platform(576, 230));
			add(new Platform(608, 230));
			add(new Platform(640, 230));
			add(new Platform(672, 230));
			add(new Platform(704, 230));
			add(new Platform(736, 230));
			add(new Platform(768, 230));
			add(new Platform(800, 230));
			
			add(new Platform(800, 230));
			
			add(new Platform(900, 270));
			add(new Platform(932, 270));
			add(new Platform(964, 270));
			add(new Platform(996, 270));
			add(new Enemy(996, 240));			

			add(new Platform(1200, 240));
			add(new Platform(1232, 240));
			add(new Platform(1264, 240));
			add(new Platform(1296, 240));
			add(new Enemy(1232, 200));
			add(new Enemy(1296, 200));

			add(new Platform(310, 270));
			add(new Platform(240, 260));
			add(new Platform(150, 255));
			add(new Platform(110, 265));

			add(new Platform(50, 235));
			
			add(new Platform(10, 175));
			add(new Platform(100, 115));
			
			add(new Platform(10, 65));//weapon
			add(new Platform(140, 55));
			add(new Platform(230, 65));
			add(new Platform(310, 50));
			
			add(new Platform(430, 65));
			add(new Platform(462, 65));//enemy
			add(new Platform(494, 65));//double jump			//player.allowDoubleJump();
			add(new Enemy(460, 33));
			
			add(new Platform(724, 110));
			add(new Platform(804, 70));
			add(new Platform(864, 50));
			add(new Platform(896, 50));//knows
			add(new Platform(928, 50));
			add(new Enemy(864, 23));
			add(new Enemy(928, 23));

			
			add(new Platform(1330, 50));
			add(new Platform(1362, 50));//language
			
			add(new Platform(1530, 250));
			add(new Platform(1630, 210));
			add(new Platform(1662, 210));
			add(new Platform(1694, 210));
			add(new Enemy(1694, 160));
			add(new Platform(1694, 210));
			add(new Platform(1694, 243));
			add(new Platform(1694, 276));
			add(new Platform(1726, 276));
			add(new Platform(1758, 276));
			add(new Platform(1790, 276));
			add(new Platform(1822, 276));
			add(new Platform(1854, 276));
			add(new Platform(1886, 276));
			add(new Platform(1918, 276));
			add(new Platform(1950, 276));
			add(new Platform(1982, 276));//boss
			add(new Platform(2014, 276));
			add(new Enemy(1822, 230));
			add(new Enemy(1854, 230));
			add(new Enemy(1886, 230));
			add(new Enemy(1950, 230));
			add(new Enemy(1982, 230));
			add(new Enemy(2014, 230));
			
			add(new Platform(1680, 96));
			add(new Platform(1880, 76));
			add(new Platform(2080, 76));
			
			add(new Platform(1670, 300));
			
			player = new Robot(this, 1694, 166);
			
			add(new WeaponMod(1594, 156));
			add(new DoubleJumpMod(1614, 156));
//			player.fly();
//			player.allowDoubleJump();
			
			//player = new Robot(this, -10, 116);
			player.setVelocity(5, 0);
			player.allowMove();
			
			add(player);
			add(new LiveCounter(this, 5, 5, 5));
		}
		
		override public function update():void {
			super.update();
			
			updateCamera();
			
			if (LiveCounter.lives <= 0) {
				if (restartCount < 0) {
					restartCount = 0;
					player.die();
					add(new TryAgainText());
				}
			}
			
			if (restartCount >= 0) {
				restartCount += FP.elapsed;
				if (restartCount > 10 || Input.released(Key.SPACE)) {
					FP.world = new WorldTwo();
				}
			} 
		}
		
		private function updateCamera():void 
		{
			var pX:Number = Math.min(Math.max(player.x, 88), 2086);
			var pY:Number = Math.min(Math.max(player.y, 67), 210); 
			var newX:Number = pX - FP.halfWidth + player.halfWidth;
			var newY:Number = pY - FP.halfHeight + player.halfHeight - 5;
			FP.setCamera(newX, newY);
		}
	}
}