/**
 * Created by Dukobpa3 on 22.10.13.
 */
package gd.eggs.cube.app
{

	import gd.eggs.mvc.app.ViewManager;
	import gd.eggs.mvc.controller.BaseController;


	public class AppController extends BaseController
	{
		public function AppController()
		{
			super();
		}

		override public function init():void
		{
			ViewManager.show(Views.MAIN_MENU);
			super.init();
		}

		override public function destroy():void
		{

			super.destroy();
		}
	}
}
