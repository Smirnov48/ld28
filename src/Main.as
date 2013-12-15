package
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import youonlygetone.worlds.WorldOne;
	import youonlygetone.worlds.WorldOneGame;

	public class Main extends Engine
	{
		public function Main()
		{
			super(200, 150, 60, false);
			scaleX = 4;
			scaleY = 4;
			   
			//FP.console.enable();
			
			//FP.world = new WorldOne();
			FP.world = new WorldOneGame();
		}
		
		override public function init():void
		{
			//trace("FlashPunk has started successfully!");
		}
	}
}