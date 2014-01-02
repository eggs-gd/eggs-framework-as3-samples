package {
	import flash.display.DisplayObjectContainer;

	import gd.eggs.cube.*;

	import flash.display.Sprite;
	import flash.events.Event;

	import gd.eggs.cube.controller.AppController;

	import gd.eggs.cube.enum.Layers;

	import gd.eggs.cube.enum.Models;
	import gd.eggs.cube.enum.Views;

	import gd.eggs.cube.model.DesignModel;
	import gd.eggs.cube.model.GameModel;
	import gd.eggs.cube.model.UserModel;
	import gd.eggs.cube.view.GameView;
	import gd.eggs.cube.view.MainMenuView;
	import gd.eggs.cube.view.StatusBarView;

	import gd.eggs.mvc.app.IBootstrap;
	import gd.eggs.mvc.app.ModelHolder;
	import gd.eggs.mvc.app.ViewHolder;

	import gd.eggs.mvc.app.applicationStartup;
	import gd.eggs.mvc.model.Model;


	[SWF(width=800, height=600)]
	public class cube_attack extends Sprite implements IBootstrap
	{

		public function cube_attack()
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(event:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);

			Config.CONTENT_ROOT = "classes/";

			applicationStartup(this, this);
		}


		public function registerModels():void
		{
			var model:Model;
			// Дизайн модель должна добавляться первой так как там только статика.
			// И эта модель используется практически везде.
			model = new DesignModel();
			model.init();
			ModelHolder.addModel(Models.DESIGN, model);

			// Следующая по важности и частоте использования модель профиля пользователя.
			model = new UserModel();
			model.init();
			ModelHolder.addModel(Models.USER, model);

			// Дальше все остальные
			model = new GameModel();
			model.init();
			ModelHolder.addModel(Models.GAME, model);
		}

		public function registerViews(root:DisplayObjectContainer):void
		{
			// reg scopes
			var gameCont:Sprite = new Sprite();
			var windowsCont:Sprite = new Sprite();
			var topCont:Sprite = new Sprite();

			root.addChild(gameCont);
			root.addChild(windowsCont);
			root.addChild(topCont);

			ViewHolder.addScope(Layers.GAME, gameCont);
			ViewHolder.addScope(Layers.WINDOWS, windowsCont);
			ViewHolder.addScope(Layers.TOP, topCont);

			// reg screens
			ViewHolder.addView(Layers.GAME, Views.GAME, new GameView());

			// reg windows
			ViewHolder.addView(Layers.WINDOWS, Views.MAIN_MENU, new MainMenuView());

			// reg top layer
			ViewHolder.addView(Layers.TOP, Views.STATUS_BAR, new StatusBarView());
		}

		public function registerControllers():void
		{
			new AppController().init();
		}

		public function startup():void
		{

		}
	}
}
