package
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import youonlygetone.worlds.WorldOne;
	import youonlygetone.worlds.WorldOneGame;
	import youonlygetone.worlds.WorldTwo;
	import youonlygetone.worlds.worldTwo.YouWinWorld;

	public class Main extends Engine
	{
		public function Main()
		{ 
			/*
			super(1600, 1200, 60, false);
			scaleX = 0.5;
			scaleY = 0.5;
			/**/
			
			
			
			super(200, 150, 60, false);
			scaleX = 4;
			scaleY = 4;
			/**/
			
			   
			//FP.console.enable();
			
			FP.world = new WorldOne();
			//FP.world = new WorldOneGame();
			//FP.rate = 0.5;
			//FP.world = new WorldTwo();
			//FP.world = new YouWinWorld();
		}
		
		override public function init():void
		{
			//trace("FlashPunk has started successfully!");
		}
	}
}