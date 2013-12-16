package youonlygetone.worlds.worldTwo 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	import youonlygetone.Skills;
	import youonlygetone.worlds.worldOne.entities.NoticeText;
	/**
	 * ...
	 * @author SmirnovAM
	 */
	public class JumpDownMod extends Entity
	{
		[Embed(source = '../../../../assets/mod.png')] private const sprite:Class;
				
		public function JumpDownMod(x:int, y:int)
		{
			this.x = x;
			this.y = y;
						
			graphic = new Spritemap(sprite, 12, 12);
			(graphic as Spritemap).add("go", [0, 1, 2, 3, 4], 8, true);
			(graphic as Spritemap).play("go");
			(graphic as Spritemap).color = 0xFFDF0b;
			
			setHitbox(12, 12);
			type = "mod";
		}
		
		public function apply():void {
			Skills.jumpDown = true;
			
			FP.world.remove(this);
			FP.world.add(new NoticeText(x, y, "Jumpdown unlocked"));
		}
		
	}

}