package util;

/**
 * ...
 * @author Mark
 */
class Point 
{
    public var x:Int;
    public var y:Int;
	
	public function new(x:Int, y:Int) {
		this.x = x;
		this.y = y;
	}
	
	public function getAdjacent():Array<Point> {
		return Point.getAdjacentPoints(this);
	}
	
	public function equals(point:Point):Bool {
		return point.x == x && point.y == y;
	}
	
	public static function distance(location:Point, otherLocation:Point):Float
	{
		var deltaX:Float = otherLocation.x - location.x;
		var deltaY:Float = otherLocation.y - location.y;
		
		return Math.sqrt(deltaX * deltaX + deltaY * deltaY);
	}
	
	public static function getAdjacentPoints(fromLocation:Point):Array<Point>
	{
		return [
			new Point(fromLocation.x,   fromLocation.y-1),
			new Point(fromLocation.x,   fromLocation.y+1),
			new Point(fromLocation.x-1, fromLocation.y  ),
			new Point(fromLocation.x+1, fromLocation.y  )
			//new Point(fromLocation.x-1, fromLocation.y-1),
			//new Point(fromLocation.x-1, fromLocation.y+1),
			//new Point(fromLocation.x+1, fromLocation.y+1),
			//new Point(fromLocation.x+1, fromLocation.y-1),
		];
	}
	
	public static function getDirectionBetween(fromLocation:Point, toLocation:Point):Direction {
		/*
		if (fromLocation.y > toLocation.y) {
			return Direction.UP;
		}
		else
		*/
		if (fromLocation.y < toLocation.y) {
			return Direction.DOWN;
		}
		else if (fromLocation.x < toLocation.x) {
			return Direction.RIGHT;
		}
		else if (fromLocation.x > toLocation.x) {
			return Direction.LEFT;
		}
		
		return Direction.UP;
	}
}

enum Direction {
	UP;
	DOWN;
	LEFT;
	RIGHT;
}