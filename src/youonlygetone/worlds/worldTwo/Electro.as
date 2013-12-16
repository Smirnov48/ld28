package youonlygetone.worlds.worldTwo 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	/**
	 * ...
	 * @author SmirnovAM
	 */
	public class Electro extends Entity
	{
		
		[Embed(source = '../../../../assets/electro.png')] private const sprite:Class;
		public function Electro(x:int, y:int)
		{
			this.x = x;
			this.y = y;
						
			graphic = new Spritemap(sprite, 48, 48);
			(graphic as Spritemap).add("go", [0, 1, 2, ], 8, true);
			(graphic as Spritemap).play("go");
			
			setHitbox(38, 38);
			type = "weapon"
		}
	}

}