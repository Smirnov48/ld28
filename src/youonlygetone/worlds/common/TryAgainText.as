package youonlygetone.worlds.common
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	/**
	 * ...
	 * @author SmirnovAM
	 */
	public class TryAgainText extends Entity
	{
		
		public function TryAgainText() 
		{
			graphic = new Text("Try Again", 60, 65, { "color":0xFF2861 } );
			graphic.scrollX = 0;
			graphic.scrollY = 0;
		}		
	}
}