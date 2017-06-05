package;

import openfl.display.Sprite;
import openfl.events.Event;
import tiles.TileMapCustom;
import tiles.tiles.TileBase;
import util.FPS_Mem;
import openfl.events.MouseEvent;

/**
 * Level class contains the world
 */
class Level extends Sprite
{
	private var tileMapBackground:TileMapCustom;
	private var tileMapForeground:TileMapCustom;
	private var player:Player;
	
	private var mapData:Array<Array<Bool>>;

	public function new(backgroundData:Array<Array<Int>>, foregroundData:Array<Array<Int>>)
	{
		super();
		
		var mapWidth:Int = backgroundData.length;
		var mapHeight:Int = backgroundData[0].length;
		
		tileMapBackground = new TileMapCustom(mapWidth, mapHeight);
		tileMapForeground = new TileMapCustom(mapWidth, mapHeight);
		
		tileMapBackground.create(backgroundData);
		tileMapForeground.create(foregroundData);
		
		addChild(tileMapBackground);
		addChild(tileMapForeground);
		
		mapData = tileMapForeground.createPathfindMap();
		
		player = new Player();
		addChild(player);
		
		var fps_mem:FPS_Mem = new FPS_Mem(10, 10, 0xffffff);
		addChild(fps_mem);
		
		addEventListener(MouseEvent.CLICK, onClick);
	}
	
	private function onClick(e:MouseEvent) {
		var tile:TileBase = tileMapForeground.getTileMouse(mouseX, mouseY);
		
		trace(tile);
	}
}