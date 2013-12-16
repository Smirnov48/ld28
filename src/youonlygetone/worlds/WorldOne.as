package youonlygetone.worlds
{
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import youonlygetone.Robot;
	import youonlygetone.worlds.worldOne.entities.SkipButton;
	import youonlygetone.worlds.worldOne.entities.Splash;
	import youonlygetone.worlds.worldOne.entities.TextForPlayer;
	import youonlygetone.worlds.worldOne.entities.TextForShing;
	import youonlygetone.worlds.worldOne.entities.Background;
	import youonlygetone.worlds.worldOne.entities.Platform;
	import youonlygetone.worlds.worldOne.entities.Shining;
	import youonlygetone.worlds.worldOne.entities.SnowFlake;
	import youonlygetone.worlds.worldOne.entities.TutorialText;
	
	public class WorldOne extends World
	{
		private var time:Number = 0;
		
		private var wasSplash:Boolean = false;
		private var wasShine:Boolean = false;
		private var wasTextOnShine:Boolean = false;
		private var wasRemoveShine:Boolean = false;
		private var player:Robot;
		private var skipButton:SkipButton;
		private var wasIntroEnded:Boolean = false;
		private var showedTutorial:Boolean = false;
		
		public function WorldOne()
		{
			super();
			add(new Background());
			for (var i:int = 0; i < 25; i++) {
				add(new SnowFlake());
			}
			add(new Platform(-32,120));
			add(new Platform(0,120));
			add(new Platform(33,120));
			add(new Platform(66,120));
			add(new Platform(102,120));
			add(new Platform(135, 120));
			add(new Platform(135,88));
			add(new Platform(168,120));
			add(new Platform(200, 120));
			player = new Robot(this, 33, 87);
			add(player);
			add(new TextForPlayer(33, 67));
			skipButton = new SkipButton(130,2);
			add(skipButton);
		}
		override public function update():void {
			super.update();
			
			var i:int;
			var flakes:Array;
			time += FP.elapsed;
			
			if (time > 12.7 && !wasSplash) {
				wasSplash = true;
				flakes = [];
				getClass(SnowFlake, flakes);
				for (i = 0; i < 25; i++) {
					flakes[i].setWind(-Math.random() - 3);
				}
				add(new Splash());
			}
			if (time > 13 && !wasShine) {
				wasShine = true;
				add(new Shining(130, 68));
			}
			if (time > 18 && !wasTextOnShine) {
				wasTextOnShine = true;
				add(new TextForShing(130, 48));
			}
			if (time > 42 && !wasRemoveShine) {
				wasRemoveShine = true;
				add(new Splash());
				remove(skipButton);
				var shinings:Array = [];
				getClass(Shining, shinings);
				remove(shinings[0]);
				
				flakes = [];
				getClass(SnowFlake, flakes);
				for (i = 0; i < 25; i++) {
					flakes[i].setWind(Math.random());
				}
			}
			if (time > 42 && !wasIntroEnded) {
				wasIntroEnded = true;
				player.allowMove();
			}
			if (time > 42 && !showedTutorial) {
				showedTutorial = true;
				add(new TutorialText(60, 10));
			}
			if (player.x > 195) {
				FP.world = new WorldOneGame();
			}
		}
	}
}