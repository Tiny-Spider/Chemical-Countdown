package tiles.tiles;
import items.Item;

/**
 * ...
 * @author Mark
 */
class TileConveyorbelt extends TileBase
{
	private var currentItem:Item;
	
	public function new(x:Float, y:Float, type:Int) 
	{
		super(x, y, type, false);
	}
	
}