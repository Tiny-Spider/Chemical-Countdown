package tiles.tiles;
import openfl.display.Tile;

/**
 * A base for tiles
 */
class TileBase extends Tile
{
	public var isWalkable:Bool = true;
	
	public function new(x:Float, y:Float, type:Int, isWalkable:Bool) 
	{
		super(type, x, y);
		
		this.isWalkable = isWalkable;
	}
	
	public function update() { };
	
	public function createNew():TileBase {
		var tile = new TileBase (x, y, id, isWalkable);
		tile.matrix = matrix.clone ();
		tile.tileset = tileset;
		return tile;
	}
}