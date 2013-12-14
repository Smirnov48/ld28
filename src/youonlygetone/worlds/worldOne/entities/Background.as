package youonlygetone.worlds.worldOne.entities
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	public class Background extends Entity
	{
		[Embed(source = '../../../../../assets/background.png')] private const bg:Class;
		
		public function Background()
		{
			graphic = new Image(bg);
		}
	}
}