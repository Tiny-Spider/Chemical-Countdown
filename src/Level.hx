package;
import openfl.display.Tile;
import openfl.display.Tilemap;
import tiles.TileManager;
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

	private var tileMap:Tilemap;
	private var tileManager:TileManager = new TileManager();
	
	private var animatedTiles:Array<TileAnimated> = new Array<TileAnimated>();

	public function new()
	{
		super();
		
		tileMap = new Tilemap(tileSize * 5, tileSize * 5, tileManager.getTileSet());
		
		for (x in 0...5) {
			for (y in 0...5) {
				var id:Int = Random.random(0, 9);
				var tile:Tile = tileManager.getTile(id);
				
				addTile(tile, x, y);
			}
		}
		
		addChild(tileMap);
		
		var fps_mem:FPS_Mem = new FPS_Mem(10, 10, 0xffffff);
		addChild(fps_mem);
		
		Lib.current.stage.addEventListener(Event.ENTER_FRAME, onFrame);
	}
	
	private function addTile(tile:Tile, x:Int, y:Int) {
		if (Std.is(tile, TileAnimated)) {
			animatedTiles.push(cast(tile, TileAnimated));
		}
		
		tileMap.addTile(tile);
		
		tile.x = tileSize * x;
		tile.y = tileSize * y;
	}

	private function onFrame(e:Event)
	{
		for (tileAnimated in animatedTiles)
		{
			tileAnimated.update();
		}
	}

}