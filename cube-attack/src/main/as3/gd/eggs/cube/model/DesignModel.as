package gd.eggs.cube.model
{

	import flash.geom.Point;

	import gd.eggs.mvc.model.BaseModel;


	public class DesignModel extends BaseModel
	{
        public static const INIT:String = "designModelInited";
        private const DESTROY:String = "designModelDestroy";


		public function DesignModel()
		{
			super();
            init();
		}

        override public function init():void
        {
            update(INIT);
            super.init();
        }

        override public function destroy():void
        {
            super.destroy();
            update(DESTROY);
        }

		public function get fieldSize():Point { return new Point(20, 10); }
	}
}
