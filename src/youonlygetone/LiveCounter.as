package youonlygetone 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	import youonlygetone.worlds.common.Heart;
	/**
	 * ...
	 * @author SmirnovAM
	 */
	public class LiveCounter extends Entity
	{
		public static var lives:int = 5;
		
		private var total:int = 0;
		private var hearts:Vector.<Heart> = new Vector.<Heart>();
		
		public function LiveCounter(world:World, x:int, y:int, count:int) 
		{
			total = count;
			lives = count;
			for (var i:int = 0; i < total; i++) 
			{
				var heart:Heart = new Heart(x + i * 13, y)
				hearts.push(heart);
				world.add(heart);
			}
		}
		
		override public function update():void
		{
			for (var i:int = 0; i < total; i++) 
			{
				var heart:Heart = hearts[i];
				if (i < lives) {
					heart.turnOn();
				} else {
					heart.turnOff();
				}				
			}
		}
	}
}