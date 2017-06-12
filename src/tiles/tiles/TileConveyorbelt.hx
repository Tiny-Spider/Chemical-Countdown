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
	
	
	public function createNew():TileBase {
		var tile = new TileConveyorbelt (x, y, id);
		tile.matrix = matrix.clone ();
		tile.tileset = tileset;
		return tile;
	}
}