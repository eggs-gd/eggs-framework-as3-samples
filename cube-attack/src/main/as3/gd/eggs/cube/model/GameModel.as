/**
 * Copyright 2013 earwiGGames team and other contributors
 * http://eggs.gd/
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 *
 * - cond 1
 * - cond 2
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
package gd.eggs.cube.model
{

	import gd.eggs.cube.enum.Models;
	import gd.eggs.mvc.app.ModelManager;
	import gd.eggs.mvc.model.BaseModel;


	public class GameModel extends BaseModel
	{
		public static const START_GAME:String = "startGame";
		public static const CLOSE_GAME:String = "closeGame";
		public static const UPDATE_FIELD:String = "updateField";

		private var _design:DesignModel;

		private var _field:Vector.<Vector.<int>>;

		public function GameModel()
		{
			_design = ModelManager.getModel(Models.DESIGN) as DesignModel;

			_field = new Vector.<Vector.<int>>();
			for (var i:int = 0; i < _design.fieldSize.x; i++)
			{
				_field[i] = new Vector.<int>();
				for (var j:int = 0; j < _design.fieldSize.y; j++)
				{
					_field[i][j] = 1;
				}
			}

			super();
		}

		public function startGame():void
		{
			update(START_GAME);
		}

		public function clickField():void
		{
			update(UPDATE_FIELD);
		}

		public function closeGame():void
		{
			update(CLOSE_GAME);
		}

		public function get field():Vector.<Vector.<int>>
		{
			return _field;
		}
	}
}
