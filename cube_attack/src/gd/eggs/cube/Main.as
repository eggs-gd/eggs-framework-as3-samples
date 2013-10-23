/**
 * Created by Dukobpa3 on 22.10.13.
 */
package gd.eggs.cube
{

	import flash.display.Sprite;
	import flash.events.Event;

	import gd.eggs.cube.Bootstrap;

    [SWF(width=800, height=600)]
	public class Main extends Sprite
	{

		public function Main()
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(event:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);

			Bootstrap.initialize(this);
		}
	}
}
