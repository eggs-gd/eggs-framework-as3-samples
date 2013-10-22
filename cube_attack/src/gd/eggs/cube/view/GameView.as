/**
 * Created by Dukobpa3 on 22.10.13.
 */
package gd.eggs.cube.view
{

	import fl.controls.Button;

	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;

	import gd.eggs.cube.app.Config;
	import gd.eggs.cube.app.Models;
	import gd.eggs.cube.model.GameModel;
	import gd.eggs.mvc.app.ModelManager;
	import gd.eggs.mvc.view.BaseView;
	import gd.eggs.mvc.view.ViewEvent;


	public class GameView extends BaseView
	{

		public static const BACK_CLICK:String = "goToMainMenu";

		private var _blocksCont:Sprite;
		private var _blocks:Vector.<Vector.<Block>>;

		private var _backBtn:Button;

		public function GameView()
		{
			var model:GameModel = ModelManager.getModel(Models.GAME) as GameModel;
			super(model);

			model.addCallback(this, GameModel.START_GAME, onGameStart);
			model.addCallback(this, GameModel.UPDATE_FIELD, onFieldUpdate);

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
			for (var i:int = 0 ; i < Config.FIELD_SIZE.x ; i ++)
			{
				for (var j:int = 0 ; j < Config.FIELD_SIZE.y ; j ++)
				{
					_blocks[i][j].update(model.field[i][j]);
				}
			}
		}

		private function onBackClick(event:MouseEvent):void
		{
			dispatchEvent(new ViewEvent(ViewEvent.CHANGE, BACK_CLICK));
		}

		private function get model():GameModel { return _model as GameModel; }
	}
}
