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
package gd.eggs.cube.view
{

	import fl.controls.Button;

	import flash.display.Sprite;
	import flash.events.MouseEvent;

	import gd.eggs.cube.Config;
	import gd.eggs.cube.enum.Models;
	import gd.eggs.cube.enum.ViewEvents;
	import gd.eggs.cube.model.GameModel;
	import gd.eggs.mvc.app.ModelManager;
	import gd.eggs.mvc.view.BaseView;
	import gd.eggs.mvc.view.ViewEvent;


	public class GameView extends BaseView
	{

		private var _blocksCont:Sprite;
		private var _blocks:Vector.<Vector.<Block>>;

		private var _backBtn:Button;

		public function GameView()
		{
			var model:GameModel = ModelManager.getModel(Models.GAME) as GameModel;
			super(model);

			model.addCallback(this, GameModel.START_GAME, onGameStart);
			model.addCallback(this, GameModel.UPDATE_FIELD, onFieldUpdate);
			model.addCallback(this, GameModel.CLOSE_GAME, onGameClose);

			init();
		}

		private function init():void
		{
			graphics.beginFill(0xaaaaaa);
			graphics.drawRect(0, 0, Config.SCREEN_SIZE.x, Config.SCREEN_SIZE.y);
			graphics.endFill();

			_blocksCont = new Sprite();
			addChild(_blocksCont);

			_blocks = new Vector.<Vector.<Block>>();

			for (var i:int = 0; i < Config.FIELD_SIZE.x; i++)
			{
				_blocks[i] = new Vector.<Block>();
				for (var j:int = 0; j < Config.FIELD_SIZE.y; j++)
				{
					var block:Block = new Block();
					block.x = i * (Config.BLOCK_SIZE.x + 2);
					block.y = j * (Config.BLOCK_SIZE.y + 2);
					_blocksCont.addChild(block);

					_blocks[i][j] = block;
				}
			}

			_blocksCont.x = (Config.SCREEN_SIZE.x - Config.FIELD_SIZE.x * (Config.BLOCK_SIZE.x + 2)) * 0.5;
			_blocksCont.y = (Config.SCREEN_SIZE.y - Config.FIELD_SIZE.y * (Config.BLOCK_SIZE.y + 2)) - 20;

			_backBtn = new Button();
			_backBtn.label = "<< Back";
			_backBtn.x = Config.SCREEN_SIZE.x - _backBtn.width - 20;
			_backBtn.y = 10;
			_backBtn.addEventListener(MouseEvent.CLICK, onBackClick);
			_backBtn.buttonMode = true;
			addChild(_backBtn);
		}

		private function onFieldUpdate():void
		{

		}

		private function onGameStart():void
		{
			for (var i:int = 0; i < Config.FIELD_SIZE.x; i++)
			{
				for (var j:int = 0; j < Config.FIELD_SIZE.y; j++)
				{
					_blocks[i][j].update(model.field[i][j]);
				}
			}
		}

		private function onGameClose():void
		{

		}

		private function onBackClick(event:MouseEvent):void
		{
			dispatchEvent(new ViewEvent(ViewEvent.CHANGE, ViewEvents.GO_TO_MAIN_MENU));
		}

		private function get model():GameModel { return _model as GameModel; }
	}
}
