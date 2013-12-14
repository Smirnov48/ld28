package youonlygetone.worlds.worldOne.entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	/**
	 * ...
	 * @author SmirnovAM
	 */
	public class TutorialText extends Entity
	{
		private var text:Text;
		
		public function TutorialText(x:int, y:int) 
		{
			this.x = x;
			this.y = y;
			text = new Text("Move - Arrows\nJump - Space", 0, 0, { "color":0x3AFF54 } );
			text.alpha = 0;
			graphic = text;
		}
		
		override public function update():void 
		{
			text.alpha += 0.002 * FP.elapsed;
		}
	}

}