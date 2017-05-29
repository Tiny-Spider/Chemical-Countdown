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
		tiles.set(0, new TileAnimated(0, 0, 10, [0, 1, 2, 3]));
		tiles.set(1, new TileBase(0, 0, 1));
		tiles.set(2, new TileBase(0, 0, 2));
		tiles.set(3, new TileBase(0, 0, 3));
		tiles.set(4, new TileBase(0, 0, 4));
		tiles.set(5, new TileBase(0, 0, 5));
		tiles.set(6, new TileBase(0, 0, 6));
		tiles.set(7, new TileBase(0, 0, 7));
		tiles.set(8, new TileBase(0, 0, 8));
		tiles.set(9, new TileBase(0, 0, 9));
	}

	private function createTileSet(atlas:BitmapData)
	{
		tileset = new Tileset(atlas);

		for (y in 0...Math.round(atlas.height / tileSize))
		{
			for (x in 0...Math.round(atlas.width / tileSize))
			{
				tileset.addRect(new Rectangle(tileSize * x, tileSize * y, tileSize, tileSize));
			}
		}
	}

	public function getTile(id:Int):Tile
	{
		return tiles.exists(id) ? tiles.get(id).clone() : null;
	}

	public function getTileSet()
	{
		return tileset;
	}
}