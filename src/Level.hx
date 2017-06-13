package;

import items.Item;
import items.ItemChemical;
import openfl.display.Sprite;
import openfl.events.Event;
import tiles.TileMapCustom;
import tiles.tiles.TileBase;
import util.FPS_Mem;
import openfl.events.MouseEvent;
import util.Point;
import tiles.tiles.IInteractable;
import tiles.tiles.TileDisposal;
import motion.Actuate;
import tiles.tiles.TileConveyorbelt;
import tiles.TileManager;
import openfl.Lib;

/**
 * Level class contains the world
 */
class Level extends Sprite
{
	public var tileMapBackground:TileMapCustom;
	public var tileMapForeground:TileMapCustom;
	public var player:Player;
	private var mapWidth:Int;
	private var mapHeight:Int;

	private var mapData:Array<Array<Bool>>;

	public function new(backgroundData:Array<Array<Int>>, foregroundData:Array<Array<Int>>)
	{
		super();

		mapWidth = backgroundData.length;
		mapHeight = backgroundData[0].length;

		tileMapBackground = new TileMapCustom(mapWidth, mapHeight, this);
		tileMapForeground = new TileMapCustom(mapWidth, mapHeight, this);

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
		
		Actuate.timer(3).onRepeat(insertRandomItem).repeat(20);
	}
	
	public function centerLevel() {
		x = (Lib.current.stage.stageWidth / 2.0) - ((mapWidth * TileManager.tileSize) / 2.0);
		y = (Lib.current.stage.stageHeight / 2.0) - ((mapHeight * TileManager.tileSize) / 2.0);
	}

	private function onClick(e:MouseEvent)
	{
		// Convert mouse coords to Point and try get Tile at that point
		var point:Point = tileMapForeground.mouseToPoint(mouseX, mouseY);
		var tile:TileBase = tileMapForeground.getTile(point);
		var interact:TileBase = null;

		// If target tile is not walkable
		if (tile != null && !tile.isWalkable)
		{
			// See if we can interact with it
			if (Std.is(tile, IInteractable))
			{
				interact = tile;
			}

			point = getNextOpenPoint(point);
		}

		// Create path and set it on the player
		var path:Array<Point> = new Pathfinder(player.getNextPoint(), point, mapData).FindPath();
		player.setPath(path, interact);

		trace('Clicked Tile: $tile');
	}
	
	private function insertRandomItem() {
		var item:Item = new ItemChemical(new ChemicalManager().GetRandomChemical());
		var tile:TileBase = tileMapForeground.getTileByCoords(0, 0);
		
		if (Std.is(tile, TileConveyorbelt)) {
			var conveyor:TileConveyorbelt = cast(tile, TileConveyorbelt);
			
			if (conveyor.addItem(item, new Point(0, 0))) {
				addChild(item);
			}
		}
	}

	// Get a nearby open tile, otherwise return the input (which will fail the pathfinding)
	private function getNextOpenPoint(centerPoint:Point)
	{
		for (point in centerPoint.getAdjacent())
		{
			if (mapData[point.x][point.y])
			{
				return point;
			}
		}

		return centerPoint;
	}
}