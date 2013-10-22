/**
 * Created by Dukobpa3 on 22.10.13.
 */
package gd.eggs.cube.view
{

	import gd.eggs.cube.app.Models;
	import gd.eggs.cube.model.UserModel;
	import gd.eggs.mvc.app.ModelManager;
	import gd.eggs.mvc.view.BaseView;


	public class StatusBarView extends BaseView
	{
		public function StatusBarView()
		{
			var model:UserModel = ModelManager.getModel(Models.GAME) as UserModel;

			super(model, true);
		}
	}
}
