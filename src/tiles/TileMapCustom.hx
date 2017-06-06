package tiles;

import openfl.display.Tile;
import openfl.display.Tilemap;
import openfl.events.Event;
import openfl.Lib;
import openfl.display.Sprite;
import tiles.tiles.TileBase;
import util.Point;

/**
 * Wrapper class for tilemap
 * @author Mark
 */
class TileMapCustom extends Sprite
{
	private var tileManager:TileManager = Main.getTileManager();

	private var tiles:Array<Array<TileBase>> = new Array<Array<TileBase>>();
	private var tileMap:Tilemap;

	// Rows 	(y): 	-
	// Columns	(x): 	|
	private var columns:Int;
	private var rows:Int;

	public function new(columns:Int, rows:Int)
	{
		super();

		this.columns = columns;
		this.rows = rows;

		tileMap = new Tilemap(columns * TileManager.tileSize, rows * TileManager.tileSize, tileManager.getTileSet());

		addChild(tileMap);

		Lib.current.stage.addEventListener(Event.ENTER_FRAME, onFrame);
	}

	public function create(tileData:Array<Array<Int>>)
	{
		tiles = [for (y in 0...tileData.length)[for (x in 0...tileData[0].length) null]];
		
		for (y in 0...tileData.length)
		{
			for (x in 0...tileData[0].length)
			{
				var tile:TileBase = tileManager.getTile(tileData[y][x]);

				if (tile != null)
				{
					tile = tile.createNew();
					addTile(tile, x, y);
				}
			}
		}

		trace(tiles.length);
	}

	public function addTile(tile:TileBase, x:Int, y:Int):TileBase
	{
		tiles[x][y] = tile;
		tileMap.addTile(tile);

		tile.x = x * TileManager.tileSize;
		tile.y = y * TileManager.tileSize;

		return tile;
	}

	// Return the tile at X, Y
	// May return null if tile does not exist
	public function getTile(point:Point):TileBase
	{
		return getTileByCoords(point.x, point.y);
	}
	
	public function getTileByCoords(x:Int, y:Int):TileBase
	{
		return tiles[x][y];
	}
	
	public function mouseToPoint(x:Float, y:Float ):Point {
		// Localize mouse position
		x = x - this.x;
		y = y - this.y;
		
		// Mouse to index
		var indexX:Int = Math.floor(x / TileManager.tileSize);
		var indexY:Int = Math.floor(y / TileManager.tileSize);
		
		trace("getTileMouse(" + x + ", " + y + ") => " + indexX + ", " + indexY);
		
		return new Point(indexX, indexY);
	}
	
	// Returns a map of bools of where you can walk
	public function createPathfindMap():Array<Array<Bool>> {
		var mapData:Array<Array<Bool>> = [for (x in 0...columns)[for (y in 0...rows) getTileByCoords(x, y) == null ? true : getTileByCoords(x, y).isWalkable ]];
		return mapData;
	}

	private function onFrame(e:Event)
	{
		for (tileArray in tiles)
		{
			for (tile in tileArray) {
				if (tile != null)
				{
					tile.update();
				}
			}
		}
	}
}