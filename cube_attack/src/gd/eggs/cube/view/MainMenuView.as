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
			btn.addEventListener(MouseEvent.CLICK, onMouseClick);
			btn.x = (Config.SIZE.x - btn.width) * 0.5;
			btn.y = (Config.SIZE.y - btn.height) * 0.5;

			this.addChild(btn);
		}

		private function onMouseClick(event:MouseEvent):void
		{

		}
	}
}
