/**
 * Created by Dukobpa3 on 22.10.13.
 */
package gd.eggs.cube.app
{

	import gd.eggs.cube.model.GameModel;
	import gd.eggs.mvc.app.ModelManager;
	import gd.eggs.mvc.app.ViewManager;
	import gd.eggs.mvc.controller.BaseController;
	import gd.eggs.observer.Notification;


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

			ViewManager.show(Views.MAIN_MENU);
			super.init();
		}

		override public function destroy():void
		{
			super.destroy();
		}

		override public function listNotifications():Array
		{
			return [
				Notifications.START_GAME,
				Notifications.CLICK_BLOCK
			]
		}

		override public function update(note:Notification):void
		{
			switch (note.name)
			{
				case Notifications.START_GAME:
					ViewManager.hideAll();
					_gameModel.startGame();
					ViewManager.show(Views.GAME);
					break;

				case Notifications.CLICK_BLOCK:
					_gameModel.clickField();
					break;
			}
		}
	}
}
