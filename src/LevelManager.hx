package;
import openfl.utils.Dictionary;

/**
 * ...
 * @author Gin
 */
class LevelManager 
{
	private var levels:Array<Level> = new Array<Level>();

	private var levelOneBackground:Array<Array<Int>> = [
		[ 0,  1,  1,  1,  2],
		[ 3,  4,  4,  4,  5],
		[ 3,  4,  4,  4,  5],
		[ 3,  4,  4,  4,  5],
		[ 6,  7,  7,  7,  8]
		];
	
	private var levelOneForeground:Array<Array<Int>> = [
		[12, 12, 12, 12, -1],
		[-1, -1, -1, -1, -1],
		[-1, -1, -1, -1, -1],
		[-1, -1, -1, -1, -1],
		[-1,  9, 10, 11, -1]
		];

	private var levelTwoBackground:Array<Array<Int>> = [
		[ 0,  1,  1,  1,  2],
		[ 3,  4,  4,  4,  5],
		[ 3,  4,  4,  4,  5],
		[ 3,  4,  4,  4,  5],
		[ 6,  7,  7,  7,  8]
		];
	
	private var levelTwoForeground:Array<Array<Int>> = [
		[-1, -1, -1, -1, -1],
		[-1, -1, -1, -1, -1],
		[-1, -1, -1, -1, -1],
		[-1, -1, -1, -1, -1],
		[-1,  9, 10, 11, -1]
		];
	
	public function new() 
	{
		levels.push(new Level(levelOneBackground, levelOneForeground));
		levels.push(new Level(levelTwoBackground, levelTwoForeground));
	}
	
	public function getLevel(id:Int) 
	{
		return id < levels.length ? levels[id] : null;
	}
	
}