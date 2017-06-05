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
	
	public static function distance(location:Point, otherLocation:Point):Float
	{
		var deltaX:Float = otherLocation.x - location.x;
		var deltaY:Float = otherLocation.y - location.y;
		return Math.sqrt(deltaX * deltaX + deltaY * deltaY);
	}
}