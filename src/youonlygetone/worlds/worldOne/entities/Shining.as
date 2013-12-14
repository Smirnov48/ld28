package youonlygetone.worlds.worldOne.entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Tween;
	import net.flashpunk.tweens.misc.AngleTween;
	/**
	 * ...
	 * @author SmirnovAM
	 */
	public class Shining extends Entity
	{
		[Embed(source = '../../../../../assets/shining.png')] private const image:Class;
		
		private var time:Number = 0;
		
		public function Shining(x:int, y:int) 
		{
			this.x = x;
			this.y = y;
			graphic = new Image(image);
			(graphic as Image).originX = 160;
			(graphic as Image).originY = 160;
		}
		
		override public function update():void {
			time += FP.elapsed;
			var img:Image = (graphic as Image);
			img.angle += 15 * FP.elapsed;
			if (time > 21) {
				img.alpha = Math.min(Math.cos(img.angle * 0.25) * 0.4 + 0.45, 0.85);
			} else {
				img.alpha = Math.min(Math.cos(img.angle * 0.25) * 0.2 + 0.75, 0.95);
			}

		}
	
	}

}