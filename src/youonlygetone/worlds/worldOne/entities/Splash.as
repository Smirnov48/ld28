package youonlygetone.worlds.worldOne.entities
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author SmirnovAM
	 */
	public class Splash extends Entity
	{
		[Embed(source='../../../../../assets/whiteScreen.png')]
		private const image:Class;
		
		private var isDec:Boolean = false;
		
		public function Splash()
		{
			graphic = new Image(image);
			(graphic as Image).alpha = 0;
		}
		
		override public function update():void
		{
			var img:Image = (graphic as Image);
			if (isDec) {
				img.alpha -= 0.5 * FP.elapsed;
				if (img.alpha < 0) {
					img.alpha = 0;
					FP.world.remove(this);
				}
			} else {
				img.alpha += 2.7 * FP.elapsed;
				if (img.alpha >= 1.0) {
					img.alpha = 1.0;
					isDec = true
				}
			}
		}
	}

}