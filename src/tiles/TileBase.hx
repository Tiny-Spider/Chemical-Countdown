package tiles;
import openfl.display.Tile;

/**
 * A base for tiles
 */
class TileBase extends Tile
{
	public function new(x:Float, y:Float, type:Int) 
	{
		super(type, x, y);
	}
	
	public function update() { };
	
	public override function clone():Tile {
		var tile = new TileBase (x, y, id);
		tile.matrix = matrix.clone ();
		tile.tileset = tileset;
		return tile;
	}
}