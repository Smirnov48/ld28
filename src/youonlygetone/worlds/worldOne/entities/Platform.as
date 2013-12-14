package youonlygetone.worlds.worldOne.entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author SmirnovAM
	 */
	public class Platform extends Entity
	{
		[Embed(source = '../../../../../assets/platform2.png')] private const image:Class;

		public function Platform(x:int, y:int) 
		{
			graphic = new Image(image);
			this.x = x;
			this.y = y;
			
			setHitbox(32, 32);
			width = 32;
			height = 32;
			type = "platform";
		}
		
	}

}