package tiles;
import openfl.geom.Rectangle;
import openfl.display.BitmapData;
import openfl.display.Tile;
import openfl.display.Tileset;
import openfl.Assets;
import openfl.utils.Dictionary;
import tiles.tiles.TileBase;
import openfl.events.Event;
import openfl.Lib;
import tiles.tiles.TileConveyorbelt;
import tiles.tiles.TileDisposal;

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

		
		tiles.set(0, new TileBase(0, 0, 0, null, false));
		tiles.set(1, new TileBase(0, 0, 1, null, false));
		tiles.set(2, new TileBase(0, 0, 2, null, false));
		tiles.set(3, new TileBase(0, 0, 3, null, false));
		tiles.set(4, new TileBase(0, 0, 4, null, false));
		tiles.set(5, new TileBase(0, 0, 5, null, false));
		tiles.set(6, new TileBase(0, 0, 6, null, false));
		tiles.set(7, new TileBase(0, 0, 7, null, false));
		tiles.set(8, new TileBase(0, 0, 8, null, false));
		tiles.set(9, new TileBase(0, 0, 9, null, false));
		tiles.set(10, new TileBase(0, 0, 10, null, false));
		tiles.set(11, new TileBase(0, 0, 11, null, false));
		tiles.set(12, new TileConveyorbelt(0, 0, 12, null));
		tiles.set(13, new TileDisposal(0, 0, 13, null, DisposalType.ACIDIC));
		tiles.set(14, new TileDisposal(0, 0, 14, null, DisposalType.ALKALINE));
		tiles.set(15, new TileDisposal(0, 0, 15, null, DisposalType.HALOGEN_RICH));
		tiles.set(16, new TileDisposal(0, 0, 16, null, DisposalType.HALOGEN_LOW));
		tiles.set(17, new TileDisposal(0, 0, 17, null, DisposalType.NEUTRAL));
		
		// Add tiles
		/*
		for (i in 0...(Math.round(tileset.bitmapData.height / tileSize) * Math.round(tileset.bitmapData.width / tileSize))) 
		{
			tiles.set(i, new TileBase(0, 0, i, false));
		}
		*/
	}

	private function createTileSet(atlas:BitmapData)
	{
		tileset = new Tileset(atlas);

		for (y in 0...Math.round(atlas.height / tileSize))
		{
			for (x in 0...Math.round(atlas.width / tileSize))
			{
				tileset.addRect(new Rectangle(x * tileSize, y * tileSize, tileSize, tileSize));
			}
		}
	}

	public function getTile(id:Int):TileBase
	{
		return tiles.exists(id) ? tiles.get(id) : null;
	}

	public function getTileSet()
	{
		return tileset;
	}
}