/**
 * Created by Dukobpa3 on 10/28/13.
 */
package gd.eggs.cube.model
{
	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;


	public class LevelDoTest
	{
		[Test]
		public function levelDoTest():void
		{
			var object:Object = {
				fieldSize:[20, 10],
				colors:[0xff0000, 0x00ff00, 0x0000ff],
				bomb:true,
				cost:[3, 5, 8],
				clicks:6
			};

			var levelDo:LevelDO = new LevelDO(object);

			assertThat(levelDo.colors[1], equalTo(0x00ff00));
			assertThat(levelDo.cost[1], equalTo(5));
			assertThat(levelDo.bomb, equalTo(true));
		}
	}
}
