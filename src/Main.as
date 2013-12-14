package
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import youonlygetone.worlds.WorldOne;

	public class Main extends Engine
	{
		public function Main()
		{
			super(200, 150, 60, false);
			scaleX = 4;
			scaleY = 4;
			
			FP.world = new WorldOne();
		}
		
		override public function init():void
		{
			//trace("FlashPunk has started successfully!");
		}
	}
}