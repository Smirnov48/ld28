package youonlygetone.worlds.worldOne.entities
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	public class SnowFlake extends Entity
	{
		[Embed(source = '../../../../../assets/SnowFlake.png')] private const bg:Class;
		
		private var num:Number = Math.random() * 5;
		private var speed:Number = Math.random() / 4 + 0.1;
		private var wind:Number = 0;
	
		public function SnowFlake()
		{
			name = "snowflake";

			x = Math.random() * 185;
			y = Math.random() * 180 - 15;
			
			graphic = new Image(bg);
		}
		
		public function setWind(value:Number):void {
			wind = value;
		}
		
		override public function update():void {
			x += Math.sin(num) / 4 + wind;
			if (x < -30) {
				x = 230;
				y = Math.random() * 180 - 15;
			}			
			if (x > 230) {
				x = -20;
				y = Math.random() * 180 - 15;
			}
			y += speed;
			num += 0.01;
			if (y > 165) {
				x = Math.random() * 200;
				speed = Math.random() / 4 + 0.1;
				y -= 180;
			}
		}
	}
}