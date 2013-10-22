/**
 * Created by Dukobpa3 on 22.10.13.
 */
package gd.eggs.cube.view
{

	import gd.eggs.cube.app.Views;
	import gd.eggs.mvc.app.ViewManager;
	import gd.eggs.mvc.view.BaseMediator;
	import gd.eggs.mvc.view.ViewEvent;


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
					ViewManager.hideAll();
					ViewManager.show(Views.GAME);
					break;

				case GameView.BACK_CLICK:
					ViewManager.hideAll();
					ViewManager.show(Views.MAIN_MENU);
					break;
			}
		}
	}
}
