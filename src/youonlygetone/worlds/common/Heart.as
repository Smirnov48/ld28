package youonlygetone.worlds.common 
{
	import flash.display.Sprite;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	/**
	 * ...
	 * @author SmirnovAM
	 */
	public class Heart extends Entity
	{
		[Embed(source = '../../../../assets/heart.png')] private const image:Class;
		
		private var sprite:Spritemap;
		public function Heart(x:int, y:int) 
		{
			sprite = new Spritemap(image, 12, 12);
			turnOn();
			graphic = sprite;
			graphic.scrollX = 0;
			graphic.scrollY = 0;
			this.x = x;
			this.y = y;				
		}	
		public function turnOn():void
		{
			sprite.setFrame(1);
		}
		public function turnOff():void 
		{
			sprite.setFrame(0);
		}
	}
}