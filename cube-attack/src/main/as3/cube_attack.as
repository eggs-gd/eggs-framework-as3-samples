package {
	import gd.eggs.cube.*;

	import flash.display.Sprite;
	import flash.events.Event;


	[SWF(width=800, height=600)]
	public class cube_attack extends Sprite
	{

		public function cube_attack()
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(event:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);

			Config.CONTENT_ROOT = "classes/";

			Bootstrap.initialize(this);
		}
	}
}
