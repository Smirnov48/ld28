package youonlygetone.worlds.worldTwo 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author SmirnovAM
	 */
	
	public class LongBackground extends Entity
	{
		[Embed(source = '../../../../assets/longbackground.png')] private const bg:Class;
		
		public function LongBackground()
		{
			graphic = new Image(bg);
		}
	}
}
