package youonlygetone.worlds.common 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author SmirnovAM
	 */
	public class Bang extends Entity
	{
		[Embed(source = '../../../../assets/bang.png')] private const image:Class;
		
		private var time:Number = 0;
		
		public function Bang(x:int, y:int) 
		{
			this.x = x;
			this.y = y;
			graphic = new Image(image);
		}		
		
		override public function update():void {
			var img:Image = (graphic as Image);
			img.alpha -= 0.9 * FP.elapsed;
			if (img.alpha < 0) {
				img.alpha = 0;
				FP.world.remove(this);
			}
		}
	}

}