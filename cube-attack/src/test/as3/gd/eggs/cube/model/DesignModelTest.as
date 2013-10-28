/**
 * Created by Dukobpa3 on 10/28/13.
 */
package gd.eggs.cube.model
{
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.async.Async;
	import org.hamcrest.assertThat;
	import org.hamcrest.collection.arrayWithSize;
	import org.hamcrest.object.equalTo;


	public class DesignModelTest
	{

		private static var designModel:DesignModel;

		[BeforeClass]
		public static function beforeClass():void
		{
			designModel = new DesignModel();
		}

		[Test(async, order=0)]
		public function loadingDataTest():void
		{
			designModel.addCallback(this, DesignModel.INIT, onDesignModelInit)
			Async.asyncNativeResponder(this, onDesignModelInit, null, 1000, null, onTimeout);
			designModel.init();
		}

		private function onTimeout(e:*):void
		{
		}

		private function onDesignModelInit():void
		{
			assertNotNull(designModel.levels);
			assertThat(designModel.isInited, equalTo(true));
		}

		[Test]
		public function testParsingData():void
		{
			assertThat(designModel.levels, arrayWithSize(8));
			assertThat(designModel.levels[5].clicks, equalTo(4));
		}
	}
}
