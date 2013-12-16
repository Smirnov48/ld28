package youonlygetone.worlds.worldTwo 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	/**
	 * ...
	 * @author SmirnovAM
	 */
	public class ElectroDown extends Entity
	{
		
		[Embed(source = '../../../../assets/electrodown.png')] private const sprite:Class;
		public function ElectroDown(x:int, y:int)
		{
			this.x = x;
			this.y = y;
						
			graphic = new Spritemap(sprite, 48, 24);
			(graphic as Spritemap).add("go", [0, 1, 2, ], 8, true);
			(graphic as Spritemap).play("go");
			
			setHitbox(38, 20);
			type = "superweapon"
		}
	}

}