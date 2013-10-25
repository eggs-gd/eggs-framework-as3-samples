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
			// �?¼�?¾�?´�?µ�?»ÑŒ Ñ?Ñ‚�?°Ñ‚�?¸�?º�?¸ �?´�?¾�?»�?¶�?½�?° �?±Ñ‹Ñ‚ÑŒ �?·�?°Ñ€�?µ�?³�?¸Ñ?Ñ‚Ñ€�?¸Ñ€�?¾�?²�?°�?½�?° Ñ?�?°�?¼�?¾�?¹ �?¿�?µÑ€�?²�?¾�?¹ Ñ‚�?°�?º �?º�?°�?º �?º �?½�?µ�?¹ �?¼�?¾�?³ÑƒÑ‚ �?¾�?±Ñ€�?°Ñ‰�?°Ñ‚ÑŒÑ?Ñ? �?´Ñ€Ñƒ�?³�?¸�?µ.
			ModelManager.addModel(Models.DESIGN, new DesignModel());
			// �?œ�?¾�?´�?µ�?»ÑŒ ÑŽ�?·�?µÑ€�?° �?²Ñ‚�?¾Ñ€�?°Ñ? �?¿�?¾ �?²�?°�?¶�?½�?¾Ñ?Ñ‚�?¸ �?¸ �?²�?¾Ñ?Ñ‚Ñ€�?µ�?±�?¾�?²�?°�?½�?¾Ñ?Ñ‚�?¸ �?² Ñ€�?°�?·�?½Ñ‹Ñ… �?¼�?µÑ?Ñ‚�?°Ñ… �?¿Ñ€�?¾�?³Ñ€�?°�?¼�?¼Ñ‹
			ModelManager.addModel(Models.USER, new UserModel());

			// �?�?�?°�?»ÑŒÑˆ�?µ �?²Ñ?�?µ �?¾Ñ?Ñ‚�?°�?»ÑŒ�?½Ñ‹�?µ
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
