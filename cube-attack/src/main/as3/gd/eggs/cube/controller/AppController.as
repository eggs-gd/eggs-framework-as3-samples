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
package gd.eggs.cube.controller
{
	import gd.eggs.cube.enum.Models;
	import gd.eggs.cube.enum.ViewEvents;
	import gd.eggs.cube.enum.Views;
	import gd.eggs.cube.model.GameModel;
	import gd.eggs.mvc.app.ModelManager;
	import gd.eggs.mvc.app.ViewManager;
	import gd.eggs.mvc.controller.BaseController;
	import gd.eggs.mvc.view.BaseView;
	import gd.eggs.mvc.view.ViewEvent;


	public class AppController extends BaseController
	{

		private var _gameModel:GameModel;

		public function AppController()
		{
			super();
		}

		override public function init():void
		{
			_gameModel = ModelManager.getModel(Models.GAME) as GameModel;

			var view:BaseView;

			view = ViewManager.getView(Views.GAME);
			view.addEventListener(ViewEvent.CHANGE, onViewChange);

			view = ViewManager.getView(Views.MAIN_MENU);
			view.addEventListener(ViewEvent.CHANGE, onViewChange);

			view = ViewManager.getView(Views.STATUS_BAR);
			view.addEventListener(ViewEvent.CHANGE, onViewChange);

			ViewManager.show(Views.MAIN_MENU);
			super.init();
		}

		override public function destroy():void
		{
			super.destroy();
		}


		private function onViewChange(event:ViewEvent):void
		{
			switch (event.subType)
			{
				case ViewEvents.GO_TO_GAME:
					_gameModel.startGame();
					ViewManager.hideAll();
					ViewManager.show(Views.GAME);
					break;

				case ViewEvents.GO_TO_MAIN_MENU:
					_gameModel.closeGame();
					ViewManager.hideAll();
					ViewManager.show(Views.MAIN_MENU);
					break;
			}
		}
	}
}
