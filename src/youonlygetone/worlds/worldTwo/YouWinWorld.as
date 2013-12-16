package youonlygetone.worlds.worldTwo 
{
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
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
	
	public class YouWinWorld extends World
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
		
		public function YouWinWorld()
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
			add(new YouWinText());
		}
	}
}