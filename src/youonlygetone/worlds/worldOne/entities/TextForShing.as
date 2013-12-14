package youonlygetone.worlds.worldOne.entities
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	/**
	 * ...
	 * @author SmirnovAM
	 */
	public class TextForShing extends Entity
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
		private var Phrase08WasSaid:Boolean = false;
		
		public function TextForShing(x:int, y:int) 
		{
			this.x = x;
			this.y = y;
			text = new Text("Hey!", -15, 0, { "color":0xFF0C10 } );
			graphic = text;
		}
		
		override public function update():void {
			timeElapsed += FP.elapsed;
			if (timeElapsed > 2.0 && !Phrase01WasSaid) { 
				Phrase01WasSaid = true;
				text.x = -28;
				text.text = "Please!";
			}
			if (timeElapsed > 5.0 && !Phrase02WasSaid) { 
				Phrase02WasSaid = true;
				text.x = -70;
				text.text = "Listen carefully!";
			}
			if (timeElapsed > 9.0 && !Phrase03WasSaid) { 
				Phrase03WasSaid = true;
				text.x = -75;
				text.text = "You can save us";
			}
			if (timeElapsed > 13.0 && !Phrase04WasSaid) { 
				Phrase04WasSaid = true;
				text.x = -38;
				text.text = "For this";
			}
			if (timeElapsed > 17.0 && !Phrase05WasSaid) { 
				Phrase05WasSaid = true;
				text.x = -45;
				text.text = "You hav^";
			}
			if (timeElapsed > 21.0 && !Phrase06WasSaid) { 
				Phrase06WasSaid = true;
				text.x = -48;
				text.text = "on!y% *ne";
			}
			if (timeElapsed > 24.0 && !Phrase07WasSaid) { 
				Phrase07WasSaid = true;
				text.x = -23;
				text.text = "~!@#$...";
			}
			if (timeElapsed > 28.0 && !Phrase08WasSaid) { 
				Phrase08WasSaid = true;
				text.x = 0;
				text.text = "";
			}
			
		}
	}

}