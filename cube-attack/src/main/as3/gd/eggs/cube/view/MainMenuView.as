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

	import fl.controls.Button;

	import flash.events.MouseEvent;

	import gd.eggs.cube.Config;
	import gd.eggs.cube.enum.Models;
	import gd.eggs.cube.enum.ViewEvents;
	import gd.eggs.cube.model.DesignModel;
	import gd.eggs.mvc.app.ModelManager;
	import gd.eggs.mvc.view.BaseView;
	import gd.eggs.mvc.view.ViewEvent;


	public class MainMenuView extends BaseView
	{
		public function MainMenuView()
		{
			var model:DesignModel = ModelManager.getModel(Models.GAME) as DesignModel;

			super(model, true);

			init();
		}

		private function init():void
		{
			var btn:Button = new Button();
			btn.label = "play";
			btn.addEventListener(MouseEvent.CLICK, onPlayClick);
			btn.x = (Config.SCREEN_SIZE.x - btn.width) * 0.5;
			btn.y = (Config.SCREEN_SIZE.y - btn.height) * 0.5;
			btn.buttonMode = true;

			this.addChild(btn);
		}

		private function onPlayClick(event:MouseEvent):void
		{
			dispatchEvent(new ViewEvent(ViewEvent.CHANGE, ViewEvents.GO_TO_GAME));
		}
	}
}
