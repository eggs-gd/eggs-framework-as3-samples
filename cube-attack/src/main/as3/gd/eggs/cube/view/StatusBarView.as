package gd.eggs.cube.view
{

	import gd.eggs.cube.enum.Models;
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
