package gd.eggs.cube.model
{

	import gd.eggs.cube.enum.Models;
	import gd.eggs.mvc.app.ModelManager;
	import gd.eggs.mvc.model.Model;


	public class GameModel extends Model
	{
		public static const START_GAME:String = "startGame";
		public static const CLOSE_GAME:String = "closeGame";
		public static const UPDATE_FIELD:String = "updateField";

		private var _design:DesignModel;

		private var _field:Vector.<Vector.<int>>;

		public function GameModel()
		{
			_design = ModelManager.getModel(Models.DESIGN) as DesignModel;

			_field = new Vector.<Vector.<int>>();
			for (var i:int = 0; i < _design.fieldSize.x; i++)
			{
				_field[i] = new Vector.<int>();
				for (var j:int = 0; j < _design.fieldSize.y; j++)
				{
					_field[i][j] = 1;
				}
			}

			super();
		}

		public function startGame():void
		{
			update(START_GAME);
		}

		public function clickField():void
		{
			update(UPDATE_FIELD);
		}

		public function closeGame():void
		{
			update(CLOSE_GAME);
		}

		public function get field():Vector.<Vector.<int>>
		{
			return _field;
		}
	}
}
