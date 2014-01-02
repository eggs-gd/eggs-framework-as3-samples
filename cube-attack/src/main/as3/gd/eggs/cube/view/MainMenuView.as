package gd.eggs.cube.view
{

	import fl.controls.Button;

	import flash.events.MouseEvent;

	import gd.eggs.cube.Config;
	import gd.eggs.cube.enum.Models;
	import gd.eggs.cube.enum.ViewEvents;
	import gd.eggs.cube.model.DesignModel;
	import gd.eggs.mvc.app.ModelHolder;
	import gd.eggs.mvc.view.View;
	import gd.eggs.mvc.view.ViewEvent;


	public class MainMenuView extends View
	{
		public function MainMenuView()
		{
			var model:DesignModel = ModelHolder.getModel(Models.GAME) as DesignModel;

			super(model, true);

			init();
		}

		override public function init():void
		{
			var btn:Button = new Button();
			btn.label = "play";
			btn.addEventListener(MouseEvent.CLICK, onPlayClick);
			btn.x = (Config.SCREEN_SIZE.x - btn.width) * 0.5;
			btn.y = (Config.SCREEN_SIZE.y - btn.height) * 0.5;
			btn.buttonMode = true;

			this.addChild(btn);
			super.init();
		}

		private function onPlayClick(event:MouseEvent):void
		{
			dispatchEvent(new ViewEvent(ViewEvent.CHANGE, ViewEvents.GO_TO_GAME));
		}
	}
}
