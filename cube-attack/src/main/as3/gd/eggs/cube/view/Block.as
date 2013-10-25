/**
 * Copyright 2013 earwiGGames team and other contributors
 * http://eggs.gd/
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 *
 * - cond 1
 * - cond 2
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
package gd.eggs.cube.view
{

	import flash.display.Sprite;
	import flash.events.MouseEvent;

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
