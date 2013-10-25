/**
 * Created by Dukobpa3 on 22.10.13.
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
