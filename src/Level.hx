package;
import openfl.display.Tile;
import openfl.display.Tilemap;
import tiles.*;
import openfl.display.Sprite;
import openfl.geom.Rectangle;
import openfl.display.BitmapData;
import openfl.display.Tile;
import openfl.display.Tileset;
import openfl.Assets;
import openfl.utils.Dictionary;
import tiles.TileAnimated;
import openfl.events.Event;
import openfl.Lib;
import util.FPS_Mem;
import util.Random;

/**
 * Level class contains the world
 */
class Level extends Sprite
{
	public static inline var tileSize:Int = 64;
	
	private var tileManager:TileManager = Main.getTileManager();

	private var tileMapBackground:Tilemap;
	private var tileMapForeground:Tilemap;
	
	private var tilesBackground:Array<TileBase> = new Array<TileBase>();
	private var tilesForeground:Array<TileBase> = new Array<TileBase>();
	
	private var demoLevelBackground:Array<Array<Int>> = [
		[ 0,  1,  1,  1,  2],
		[ 3,  4,  4,  4,  5],
		[ 3,  4,  4,  4,  5],
		[ 3,  4,  4,  4,  5],
		[ 6,  7,  7,  7,  8]
		];
	
	private var demoLevelForeground:Array<Array<Int>> = [
		[-1, -1, -1, -1, -1],
		[-1, -1, -1, -1, -1],
		[-1, -1, -1, -1, -1],
		[-1, -1, -1, -1, -1],
		[-1,  9, 10, 11, -1]
		];

	public function new()
	{
		super();
		
		tileMapBackground = new Tilemap(tileSize * 5, tileSize * 5, tileManager.getTileSet());
		tileMapForeground = new Tilemap(tileSize * 5, tileSize * 5, tileManager.getTileSet());
		
		for (y in 0...demoLevelBackground.length) {
			for (x in 0...demoLevelBackground[0].length) {
				//trace("Building " + demoLevel[y][x] + " at " + x + ", " + y);
				
				var tile:TileBase = tileManager.getTile(demoLevelBackground[x][y]);
				
				if (tile != null) {
					tilesBackground.push(tile);
					tileMapBackground.addTile(tile);
					
					tile.x = tileSize * x;
					tile.y = tileSize * y;
				}
			}
		}
		
		for (y in 0...demoLevelForeground.length) {
			for (x in 0...demoLevelForeground[0].length) {
				//trace("Building " + demoLevel[y][x] + " at " + x + ", " + y);
				
				var tile:TileBase = tileManager.getTile(demoLevelForeground[x][y]);
				
				if (tile != null) {
					tilesForeground.push(tile);
					tileMapForeground.addTile(tile);
					
					tile.x = tileSize * x;
					tile.y = tileSize * y;
				}
			}
		}
		
		addChild(tileMapBackground);
		addChild(tileMapForeground);
		
		var fps_mem:FPS_Mem = new FPS_Mem(10, 10, 0xffffff);
		addChild(fps_mem);
		
		Lib.current.stage.addEventListener(Event.ENTER_FRAME, onFrame);
	}

	private function onFrame(e:Event)
	{
		for (tile in tilesBackground)
		{
			tile.update();
		}
	}

}