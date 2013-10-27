package gd.eggs.cube.view
{

	import fl.controls.Button;

	import flash.display.Sprite;
	import flash.events.MouseEvent;

	import gd.eggs.cube.Config;
	import gd.eggs.cube.enum.Models;
	import gd.eggs.cube.enum.ViewEvents;
import gd.eggs.cube.model.DesignModel;
import gd.eggs.cube.model.GameModel;
	import gd.eggs.mvc.app.ModelManager;
	import gd.eggs.mvc.view.BaseView;
	import gd.eggs.mvc.view.ViewEvent;


	public class GameView extends BaseView
	{

		private var _blocksCont:Sprite;
		private var _blocks:Vector.<Vector.<Block>>;

		private var _backBtn:Button;

        private var _design:DesignModel;

		public function GameView()
		{
			var model:GameModel = ModelManager.getModel(Models.GAME) as GameModel;
			super(model);

            _design = ModelManager.getModel(Models.DESIGN) as DesignModel;

			model.addCallback(this, GameModel.START_GAME, onGameStart);
			model.addCallback(this, GameModel.UPDATE_FIELD, onFieldUpdate);
			model.addCallback(this, GameModel.CLOSE_GAME, onGameClose);

            if (!_design.isInited) _design.addCallback(this, DesignModel.INIT, init);
            else init();
		}

		override public function init():void
		{
			_design.removeCallback(this, DesignModel.INIT, init);

            graphics.beginFill(0xaaaaaa);
			graphics.drawRect(0, 0, Config.SCREEN_SIZE.x, Config.SCREEN_SIZE.y);
			graphics.endFill();

			_blocksCont = new Sprite();
			addChild(_blocksCont);

            _blocksCont.x = (Config.SCREEN_SIZE.x - _design.fieldSize.x * (Config.BLOCK_SIZE.x + 2)) * 0.5;
            _blocksCont.y = (Config.SCREEN_SIZE.y - _design.fieldSize.y * (Config.BLOCK_SIZE.y + 2)) - 20;

            _blocks = new Vector.<Vector.<Block>>();

            for (var i:int = 0; i < _design.fieldSize.x; i++)
            {
                _blocks[i] = new Vector.<Block>();
                for (var j:int = 0; j < _design.fieldSize.y; j++)
                {
                    var block:Block = new Block();
                    block.x = i * (Config.BLOCK_SIZE.x + 2);
                    block.y = j * (Config.BLOCK_SIZE.y + 2);
                    _blocksCont.addChild(block);

                    _blocks[i][j] = block;
                }
            }

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
            for (var i:int = 0; i < _design.fieldSize.x; i++)
			{
                for (var j:int = 0; j < _design.fieldSize.y; j++)
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
