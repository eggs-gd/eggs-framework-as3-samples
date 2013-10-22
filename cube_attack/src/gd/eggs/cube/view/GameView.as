/**
 * Created by Dukobpa3 on 22.10.13.
 */
package gd.eggs.cube.view
{

	import gd.eggs.cube.app.Models;
	import gd.eggs.cube.model.GameModel;
	import gd.eggs.mvc.app.ModelManager;
	import gd.eggs.mvc.view.BaseView;


	public class GameView extends BaseView
	{
		public function GameView()
		{
			var model:GameModel = ModelManager.getModel(Models.GAME) as GameModel;

			super(model, true);
		}
	}
}
