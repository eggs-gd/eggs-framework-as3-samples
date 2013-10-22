/**
 * Created by Dukobpa3 on 22.10.13.
 */
package gd.eggs.cube.model
{

	import gd.eggs.cube.app.Config;
	import gd.eggs.mvc.model.BaseModel;


	public class GameModel extends BaseModel
	{
		public static const START_GAME:String = "startGame";
		public static const UPDATE_FIELD:String = "updateField";

		private var _field:Vector.<Vector.<int>>;

		public function GameModel()
		{
			_field = new Vector.<Vector.<int>>();
			for (var i:int = 0 ; i < Config.FIELD_SIZE.x ; i ++)
			{
				_field[i] = new Vector.<int>();
				for (var j:int = 0 ; j < Config.FIELD_SIZE.y ; j ++)
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

		public function get field():Vector.<Vector.<int>>
		{
			return _field;
		}
	}
}
