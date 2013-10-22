/**
 * Created by Dukobpa3 on 22.10.13.
 */
package gd.eggs.cube.app
{

	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;

	import gd.eggs.cube.model.DesignModel;

	import gd.eggs.cube.model.GameModel;
	import gd.eggs.cube.model.UserModel;

	import gd.eggs.cube.view.GameView;
	import gd.eggs.cube.view.MainMenuView;
	import gd.eggs.cube.view.Mediator;
	import gd.eggs.cube.view.StatusBarView;

	import gd.eggs.mvc.app.IBootstrap;
	import gd.eggs.mvc.app.ModelManager;
	import gd.eggs.mvc.app.ViewManager;
	import gd.eggs.mvc.controller.BaseController;
	import gd.eggs.mvc.view.BaseView;
	import gd.eggs.util.Validate;


	public class Bootstrap implements IBootstrap
	{
		private static var _instance:Bootstrap;

		private var _root:DisplayObjectContainer;
		private var _appController:AppController;

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
			ModelManager.addModel(Models.GAME, new GameModel());
			ModelManager.addModel(Models.USER, new UserModel());
			ModelManager.addModel(Models.DESIGN, new DesignModel());
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

			var mediator:Mediator = new Mediator();

			// reg screens
			var view:BaseView = new GameView();
			ViewManager.addView(Layers.GAME, Views.GAME, view);
			mediator.injectView(view);

			// reg windows
			view = new MainMenuView();
			ViewManager.addView(Layers.WINDOWS, Views.MAIN_MENU, view);
			mediator.injectView(view);

			// reg top layer
			view = new StatusBarView();
			ViewManager.addView(Layers.TOP, Views.STATUS_BAR, view);
			mediator.injectView(view);
		}

		public function registerNotifications():void
		{

		}

		public function registerControllers():void
		{
			_appController = new AppController();
			_appController.init();
		}

		public function get appController():BaseController { return _appController; }
	}
}
