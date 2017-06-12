package;

import openfl.display.Sprite;
import openfl.events.Event;
import tiles.TileMapCustom;
import tiles.tiles.TileBase;
import util.FPS_Mem;
import openfl.events.MouseEvent;
import util.Point;
import tiles.tiles.IInteractable;
import tiles.tiles.TileDisposal;

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

	private function onClick(e:MouseEvent)
	{
		// Convert mouse coords to Point and try get Tile at that point
		var point:Point = tileMapForeground.mouseToPoint(mouseX, mouseY);
		var tile:TileBase = tileMapForeground.getTile(point);
		var interact:IInteractable = null;

		// If target tile is not walkable
		if (tile != null && !tile.isWalkable)
		{
			// See if we can interact with it
			if (Std.is(tile, IInteractable))
			{
				interact = cast(tile, IInteractable);
			}

			point = getNextOpenPoint(point);
		}

		// Create path and set it on the player
		var path:Array<Point> = new Pathfinder(player.getNextPoint(), point, mapData).FindPath();
		player.setPath(path, interact);

		trace("Clicked Tile: " + tile);
	}

	// Get a nearby open tile, otherwise return the input (which will fail the pathfinding)
	private function getNextOpenPoint(centerPoint:Point)
	{
		for (point in Pathfinder.GetAdjacentLocations(centerPoint))
		{
			if (mapData[point.x][point.y])
			{
				return point;
			}
		}

		return centerPoint;
	}
}