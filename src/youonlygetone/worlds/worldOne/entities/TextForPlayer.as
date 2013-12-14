package youonlygetone.worlds.worldOne.entities
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	/**
	 * ...
	 * @author SmirnovAM
	 */
	public class TextForPlayer extends Entity
	{
		private var timeElapsed:Number = 0;
		private var text:Text;
		
		private var Phrase01WasSaid:Boolean = false;
		private var Phrase02WasSaid:Boolean = false;
		private var Phrase03WasSaid:Boolean = false;
		private var Phrase04WasSaid:Boolean = false;
		private var Phrase05WasSaid:Boolean = false;
		private var Phrase06WasSaid:Boolean = false;
		private var Phrase07WasSaid:Boolean = false;
		
		public function TextForPlayer(x:int, y:int) 
		{
			this.x = x;
			this.y = y;
			text = new Text("", 10, 0, { "color":0x68D1FF } );
			graphic = text;
		}
		
		override public function update():void {
			timeElapsed += FP.elapsed;
			if (timeElapsed > 2.0 && !Phrase01WasSaid) { 
				Phrase01WasSaid = true;
				text.text = "...";
			}
			if (timeElapsed > 6.0 && !Phrase02WasSaid) { 
				Phrase02WasSaid = true;
				text.x = -28;
				text.text = "Where am I?";
			}
			if (timeElapsed > 10.0 && !Phrase03WasSaid) { 
				Phrase03WasSaid = true;
				text.x = -75;
				text.text = "";
			}
			if (timeElapsed > 52.0 && !Phrase04WasSaid) { 
				Phrase04WasSaid = true;
				text.x = -28;
				text.text = "What was it?";
			}
			if (timeElapsed > 56.0 && !Phrase05WasSaid) { 
				Phrase05WasSaid = true;
				text.x = -20;
				text.text = "Seems someone\n   in trouble";
			}
			if (timeElapsed > 60.0 && !Phrase06WasSaid) { 
				Phrase06WasSaid = true;
				text.x = -20;
				text.text = "I must hurry up";
			}
			if (timeElapsed > 64.0 && !Phrase07WasSaid) { 
				Phrase07WasSaid = true;
				text.x = 0;
				text.text = "";
			}
			
		}
	}

}