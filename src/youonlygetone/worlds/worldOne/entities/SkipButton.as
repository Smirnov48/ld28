package youonlygetone.worlds.worldOne.entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import youonlygetone.worlds.WorldOneGame;
	/**
	 * ...
	 * @author SmirnovAM
	 */
	public class SkipButton extends Entity 
	{
		
		public function SkipButton(x:int, y:int) 
		{
			this.x = x;
			this.y = y;
			graphic = new Text("Click to Skip >>>", 0, 0, { "color":0x68D1FF, "size":8 } );
			(graphic as Text).alpha = 0.5;
			setHitbox(100, 20);
		}
		
		override public function update():void
		{
			if (collidePoint(x, y, Input.mouseX, Input.mouseY) && Input.mouseReleased)
			{   
				FP.world = new WorldOneGame();
			}
		}
	}
}