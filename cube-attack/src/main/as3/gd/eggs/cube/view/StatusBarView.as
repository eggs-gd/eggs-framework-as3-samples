package gd.eggs.cube.view
{

	import gd.eggs.cube.enum.Models;
	import gd.eggs.cube.model.UserModel;
	import gd.eggs.mvc.app.ModelHolder;
	import gd.eggs.mvc.view.View;


	public class StatusBarView extends View
	{
		public function StatusBarView()
		{
			var model:UserModel = ModelHolder.getModel(Models.GAME) as UserModel;

			super(model, true);
		}
	}
}
