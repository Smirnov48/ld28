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
	public class WeaponMod extends Entity
	{
		[Embed(source = '../../../../assets/mod.png')] private const sprite:Class;
				
		public function WeaponMod(x:int, y:int)
		{
			this.x = x;
			this.y = y;
						
			graphic = new Spritemap(sprite, 12, 12);
			(graphic as Spritemap).add("go", [0, 1, 2, 3, 4], 8, true);
			(graphic as Spritemap).play("go");
			
			setHitbox(12, 12);
			type = "mod";
		}
		
		public function apply():void {
			Skills.allowWeapon = true;
			FP.world.remove(this);
			FP.world.add(new NoticeText(x, y, "Weapon unlocked"));
		}
		
	}

}