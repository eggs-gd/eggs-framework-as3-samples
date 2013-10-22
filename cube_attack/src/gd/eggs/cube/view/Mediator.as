/**
 * Created by Dukobpa3 on 22.10.13.
 */
package gd.eggs.cube.view
{

	import gd.eggs.cube.app.Notifications;
	import gd.eggs.cube.app.Views;
	import gd.eggs.mvc.app.ViewManager;
	import gd.eggs.mvc.view.BaseMediator;
	import gd.eggs.mvc.view.ViewEvent;
	import gd.eggs.observer.Notification;


	public class Mediator extends BaseMediator
	{
		public function Mediator()
		{
			super();
		}

		override protected function onViewChange(event:ViewEvent):void
		{
			switch (event.subType)
			{
				case MainMenuView.CLICK_PLAY:
					sendNotification(new Notification(Notifications.START_GAME));
					break;

				case GameView.BACK_CLICK:
					ViewManager.hideAll();
					ViewManager.show(Views.MAIN_MENU);
					break;
			}
		}
	}
}
