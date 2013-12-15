package youonlygetone.worlds.common 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author SmirnovAM
	 */
	public class ScreenBorder extends Entity
	{
		[Embed(source = '../../../../assets/screenBorder.png')] private const bg:Class;
		
		public function ScreenBorder() 
		{
			graphic = new Image(bg);
		}
		
	}

}