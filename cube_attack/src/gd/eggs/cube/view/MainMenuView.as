/**
 * Created by Dukobpa3 on 22.10.13.
 */
package gd.eggs.cube.view
{

	import fl.controls.Button;

	import flash.events.MouseEvent;

	import gd.eggs.cube.app.Config;

	import gd.eggs.cube.app.Models;
	import gd.eggs.cube.model.DesignModel;
	import gd.eggs.mvc.app.ModelManager;
	import gd.eggs.mvc.view.BaseView;
	import gd.eggs.mvc.view.ViewEvent;


	public class MainMenuView extends BaseView
	{
		public static const CLICK_PLAY:String = "clickPlay";

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
			dispatchEvent(new ViewEvent(ViewEvent.CHANGE, CLICK_PLAY));
		}
	}
}
