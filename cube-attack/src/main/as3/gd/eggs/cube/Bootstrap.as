/**
 * Copyright 2013 earwiGGames team and other contributors
 * http://eggs.gd/
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 *
 * - cond 1
 * - cond 2
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
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
			// модель �?татики должна быть зареги�?трирована �?амой первой так как к ней могут обращать�?�? другие.
			ModelManager.addModel(Models.DESIGN, new DesignModel());
			// Модель юзера втора�? по важно�?ти и во�?требовано�?ти в разных ме�?тах программы
			ModelManager.addModel(Models.USER, new UserModel());

			// Дальше в�?е о�?тальные
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
