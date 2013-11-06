package gd.eggs.cube
{

	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;

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
	import gd.eggs.mvc.app.ModelManager;
	import gd.eggs.mvc.app.ViewManager;
	import gd.eggs.mvc.controller.BaseController;
	import gd.eggs.mvc.model.BaseModel;
	import gd.eggs.util.Validate;


	public class Bootstrap implements IBootstrap
	{
		private static var _instance:Bootstrap;

		private var _root:DisplayObjectContainer;

		public static function initialize(root:DisplayObjectContainer):void
		{
			if (Validate.isNull(_instance))
			{
				_instance = new Bootstrap();
				_instance._root = root;
				_instance.init();
			}
		}

		public function init():void
		{
			registerModels();
			registerViews();
			registerControllers();
		}

		public function destroy():void
		{

		}

		public function registerModels():void
		{
			var model:BaseModel;
			// Дизайн модель должна добавляться первой так как там только статика.
			// И эта модель используется практически везде.
			model = new DesignModel();
			model.init();
			ModelManager.addModel(Models.DESIGN, model);
			// Следующая по важности и частоте использования модель профиля пользователя.
			model = new UserModel();
			model.init();
			ModelManager.addModel(Models.USER, model);

			// Дальше все остальные
			model = new GameModel();
			model.init();
			ModelManager.addModel(Models.GAME, model);
		}

		public function registerViews():void
		{
			// reg scopes
			var gameCont:Sprite = new Sprite();
			var windowsCont:Sprite = new Sprite();
			var topCont:Sprite = new Sprite();

			_root.addChild(gameCont);
			_root.addChild(windowsCont);
			_root.addChild(topCont);

			ViewManager.addScope(Layers.GAME, gameCont);
			ViewManager.addScope(Layers.WINDOWS, windowsCont);
			ViewManager.addScope(Layers.TOP, topCont);

			// reg screens
			ViewManager.addView(Layers.GAME, Views.GAME, new GameView());

			// reg windows
			ViewManager.addView(Layers.WINDOWS, Views.MAIN_MENU, new MainMenuView());

			// reg top layer
			ViewManager.addView(Layers.TOP, Views.STATUS_BAR, new StatusBarView());
		}

		public function registerControllers():void
		{
			new AppController().init();
		}

	}
}
