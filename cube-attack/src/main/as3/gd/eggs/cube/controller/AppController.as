package gd.eggs.cube.controller
{
	import gd.eggs.cube.enum.Models;
	import gd.eggs.cube.enum.ViewEvents;
	import gd.eggs.cube.enum.Views;
	import gd.eggs.cube.model.GameModel;
	import gd.eggs.mvc.app.ModelHolder;
	import gd.eggs.mvc.app.ViewHolder;
	import gd.eggs.mvc.controller.Controller;
	import gd.eggs.mvc.view.View;
	import gd.eggs.mvc.view.ViewEvent;


	public class AppController extends Controller
	{

		private var _gameModel:GameModel;

		public function AppController()
		{
			super();
		}

		override public function init():void
		{
			_gameModel = ModelHolder.getModel(Models.GAME) as GameModel;

			var view:View;

			view = ViewHolder.getView(Views.GAME);
			view.addEventListener(ViewEvent.CHANGE, onViewChange);

			view = ViewHolder.getView(Views.MAIN_MENU);
			view.addEventListener(ViewEvent.CHANGE, onViewChange);

			view = ViewHolder.getView(Views.STATUS_BAR);
			view.addEventListener(ViewEvent.CHANGE, onViewChange);

			ViewHolder.show(Views.MAIN_MENU);
			super.init();
		}

		override public function destroy():void
		{
			var view:View;

			view = ViewHolder.getView(Views.GAME);
			view.removeEventListener(ViewEvent.CHANGE, onViewChange);

			view = ViewHolder.getView(Views.MAIN_MENU);
			view.removeEventListener(ViewEvent.CHANGE, onViewChange);

			view = ViewHolder.getView(Views.STATUS_BAR);
			view.removeEventListener(ViewEvent.CHANGE, onViewChange);

			super.destroy();
		}


		private function onViewChange(event:ViewEvent):void
		{
			switch (event.subType)
			{
				case ViewEvents.GO_TO_GAME:
					_gameModel.startGame();
					ViewHolder.hideAll();
					ViewHolder.show(Views.GAME);
					break;

				case ViewEvents.GO_TO_MAIN_MENU:
					_gameModel.closeGame();
					ViewHolder.hideAll();
					ViewHolder.show(Views.MAIN_MENU);
					break;
			}
		}
	}
}
