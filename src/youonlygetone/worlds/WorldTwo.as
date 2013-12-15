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
	import youonlygetone.worlds.worldTwo.LongBackground;
	
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
		private var sb:ScreenBorder;
		
		public function WorldTwo()
		{
			super();
			add(new LongBackground());
			/*
			for (var i:int = 0; i < 25; i++) {
				var flake:SnowFlake = new SnowFlake();
				flake.setWind(Math.random());
				add(flake);
			}
			*/
//			add(new Platform(350, 230));

//			add(new Platform(350, 270));
//			add(new Platform(460, 230));

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

			add(new Platform(1200, 240));
			add(new Platform(1232, 240));
			add(new Platform(1264, 240));
			add(new Platform(1296, 240));

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
			add(new Platform(494, 65));//double jump
			
			add(new Platform(494, 65));
			add(new Platform(494, 65));
			
			add(new Platform(724, 110));
			add(new Platform(804, 70));
			add(new Platform(864, 50));
			add(new Platform(896, 50));
			add(new Platform(930, 50));
			
			player = new Robot(690, 196);
			//player = new Robot(-10, 116);
			//player.setVelocity(10, 0);
			player.allowDoubleJump();
			player.allowMove();
//			player.fly();
			add(player);
			add(new LiveCounter(this, 5, 5, 5));
			
			sb = new ScreenBorder(); 
			add(sb);
		}
		
		override public function update():void {
			super.update();
			
			sb.x = player.x - 100 + 11;
			sb.y = player.y - 75 + 12;
			
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