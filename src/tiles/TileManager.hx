package tiles;
import openfl.geom.Rectangle;
import openfl.display.BitmapData;
import openfl.display.Tile;
import openfl.display.Tileset;
import openfl.Assets;
import openfl.utils.Dictionary;
import tiles.TileBase;
import openfl.events.Event;
import openfl.Lib;

/**
 * Class that manages all tiles
 */
class TileManager
{
	public static inline var tileSize:Int = 64;

	public var tiles:Dictionary<Int, TileBase> = new Dictionary<Int, TileBase>();

	private var tileset:Tileset;

	public function new()
	{
		createTileSet(Assets.getBitmapData("img/tile_atlas.png"));

		// Add tiles
		for (i in 0...(Math.round(tileset.bitmapData.height / tileSize) * Math.round(tileset.bitmapData.width / tileSize))) {
			tiles.set(i, new TileBase(0, 0, i));
		}
	}

	private function createTileSet(atlas:BitmapData)
	{
		tileset = new Tileset(atlas);

		for (y in 0...Math.round(atlas.height / tileSize))
		{
			for (x in 0...Math.round(atlas.width / tileSize))
			{
				trace("Creating tile: " + tileset.addRect(new Rectangle(tileSize * y, tileSize * x, tileSize, tileSize)) + " at " + (tileSize * y) + ", " + (tileSize * x));
				//tileset.addRect(new Rectangle(tileSize * y, tileSize * x, tileSize, tileSize));
			}
		}
	}

	public function getTile(id:Int):TileBase
	{
		return tiles.exists(id) ? tiles.get(id).createNew() : null;
	}

	public function getTileSet()
	{
		return tileset;
	}
}