/**
 * Created by Dukobpa3 on 22.10.13.
 */
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
	import gd.eggs.util.Validate;


	public class Bootstrap implements IBootstrap
	{
		private static var _instance:Bootstrap;

		private var _root:DisplayObjectContainer;

		public function Bootstrap()
		{

		}

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
			registerNotifications();
			registerControllers();
		}

		public function destroy():void
		{

		}

		public function registerModels():void
		{
			// модель статики должна быть зарегистрирована самой первой так как к ней могут обращаться другие.
			ModelManager.addModel(Models.DESIGN, new DesignModel());
			// Модель юзера вторая по важности и востребованости в разных местах программы
			ModelManager.addModel(Models.USER, new UserModel());

			// Дальше все остальные
			ModelManager.addModel(Models.GAME, new GameModel());
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

		public function registerNotifications():void
		{

		}

		public function registerControllers():void
		{
			var controller:BaseController;

			controller = new AppController();
			controller.init();
		}

	}
}
