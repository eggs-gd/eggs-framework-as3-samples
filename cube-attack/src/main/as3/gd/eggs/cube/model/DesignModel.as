package gd.eggs.cube.model
{

	import flash.geom.Point;

	import gd.eggs.mvc.model.BaseModel;


	public class DesignModel extends BaseModel
	{
		public function DesignModel()
		{
			super();
		}

		public function get fieldSize():Point { return new Point(20, 10); }
	}
}
