/**
 * Created by Dukobpa3 on 22.10.13.
 */
package gd.eggs.cube.view
{

	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;

	import gd.eggs.cube.Config;


	public class Block extends Sprite
	{
		private var _type:int;

		public function Block()
		{
			buttonMode = true;
			addEventListener(MouseEvent.ROLL_OVER, onMouseOver);
			addEventListener(MouseEvent.ROLL_OUT, onMouseOut);
		}

		public function update(type:int):void
		{
			_type = type;

			if (!_type)
			{
				visible = false;
				return;
			}

			graphics.clear();
			graphics.lineStyle(2);
			graphics.beginFill(0xff0000);
			graphics.drawRoundRect(0, 0, Config.BLOCK_SIZE.x, Config.BLOCK_SIZE.y, 5);
			graphics.endFill();
		}

		public function remove():void
		{

		}


		private function onMouseOver(event:MouseEvent):void
		{
			alpha = 0.8;
		}

		private function onMouseOut(event:MouseEvent):void
		{
			alpha = 1;
		}
	}
}
