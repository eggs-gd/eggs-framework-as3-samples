package gd.eggs.cube.model
{
	import flash.geom.Point;


	public class LevelDO
	{

		private var _fieldSize:Point;
		private var _colors:Vector.<int>;
		private var _bomb:Boolean;
		private var _cost:Vector.<int>;
		private var _clicks:int;

		public function LevelDO(data:Object)
		{
			// TODO никаких валидаций:) Верим в адекватность геймдизов и светлое будущее
			_fieldSize = new Point(data["fieldSize"][0], data["fieldSize"][1]);
			_colors = Vector.<int>(data["colors"]);
			_bomb = data["bomb"];
			_cost = Vector.<int>(data["cost"]);
			_clicks = data["clicks"];
		}

		public function get fieldSize():Point
		{
			return _fieldSize;
		}

		public function get colors():Vector.<int>
		{
			return _colors;
		}

		public function get bomb():Boolean
		{
			return _bomb;
		}

		public function get cost():Vector.<int>
		{
			return _cost;
		}

		public function get clicks():int
		{
			return _clicks;
		}
	}
}
