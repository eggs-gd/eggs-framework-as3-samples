package gd.eggs.cube.model
{

	import flash.events.Event;
	import flash.geom.Point;
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	import gd.eggs.cube.Config;

	import gd.eggs.cube.model.dataobject.LevelDO;

	import gd.eggs.mvc.model.BaseModel;


	public class DesignModel extends BaseModel
	{
		private var _levels:Vector.<LevelDO>;

		public function DesignModel()
		{
			super();
		}

		override public function init():void
		{
			var loader:URLLoader = new URLLoader();
			var request:URLRequest = new URLRequest(Config.CONTENT_ROOT + "config.json");
			loader.addEventListener(Event.COMPLETE, onLoadingComplete)
			loader.load(request);
		}

		private function onLoadingComplete(event:Event):void
		{
			var loader:URLLoader = event.currentTarget as URLLoader;
			var data:Object = JSON.parse(loader.data);
			trace(loader.data);

			_levels = new Vector.<LevelDO>();

			for (var i:int = 0; i < data["levels"]["length"]; i++)
			{
				_levels.push(new LevelDO(data["levels"][i]));
			}

			super.init();
		}

		override public function destroy():void
		{
			super.destroy();
		}

		public function get fieldSize():Point { return new Point(20, 10); }

		public function get levels():Vector.<LevelDO> { return _levels; }
	}
}
