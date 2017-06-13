package;

import util.Point;

/**
 * ...
 * @author Mark
 */
class Pathfinder 
{
	private var width:Int;
	private var height:Int;
	private var nodes:Array<Array<Node>>;
	private var startNode:Node;
	private var endNode:Node;

	public function new(startPosition:Point, endPosition:Point, map:Array<Array<Bool>>)
	{
		InitializeNodes(map, endPosition);
		
		//trace(nodes.length);
		//trace(nodes[0].length);
		
		startNode = nodes[startPosition.x][startPosition.y];
		startNode.state = NodeState.Open;
		endNode = nodes[endPosition.x][endPosition.y];
	}

	public function FindPath():Array<Point>
	{
		// The start node is the first entry in the 'open' list
		var path:Array<Point> = new Array<Point>();
		var success:Bool = Search(startNode);
		
		if (success)
		{
			// If a path was found, follow the parents from the end node to build a list of locations
			var node:Node = endNode;
			while (node.parentNode != null)
			{
				path.push(node.location);
				node = node.parentNode;
			}

			// Reverse the list so it's in the correct order when returned
			path.reverse();
		}

		return path;
	}

	private function InitializeNodes(map:Array<Array<Bool>>, endPosition:Point)
	{
		width = map.length;
		height = map[0].length;
		nodes = [for (x in 0...width)[for (y in 0...height) new Node(x, y, map[x][y], endPosition)]];
	}

	private function Search(currentNode:Node):Bool
	{
		// Set the current node to Closed since it cannot be traversed more than once
		currentNode.state = NodeState.Closed;
		var nextNodes:Array<Node> = GetAdjacentWalkableNodes(currentNode);
		
		// Sort by F-value so that the shortest possible routes are considered first
		nextNodes.sort(function(a, b):Int {
		    if (a.F < b.F) return -1;
		    else if (a.F > b.F) return 1;
		    return 0;
		});
		
		for (nextNode in nextNodes)
		{
			// Check whether the end node has been reached
			if (nextNode.location == endNode.location)
			{
				return true;
			}
			else
			{
				// If not, check the next set of nodes
				if (Search(nextNode)) // Note: Recurses back into Search(Node)
					return true;
			}
		}

		// The method returns false if this path leads to be a dead end
		return false;
	}

	private function GetAdjacentWalkableNodes(fromNode:Node):Array<Node>
	{
		var walkableNodes:Array<Node> = new Array<Node>();
		var nextLocations:Array<Point> = fromNode.location.GetAdjacent();

		for (location in nextLocations)
		{
			var x:Int = location.x;
			var y:Int = location.y;

			// Stay within the grid's boundaries
			if (x < 0 || x >= width || y < 0 || y >= height)
				continue;

			var node:Node = nodes[x][y];
			// Ignore non-walkable nodes
			if (!node.isWalkable)
				continue;

			// Ignore already-closed nodes
			if (node.state == NodeState.Closed)
				continue;

			// Already-open nodes are only added to the list if their G-value is lower going via this route.
			if (node.state == NodeState.Open)
			{
				var traversalCost:Float = Point.distance(node.location, node.parentNode.location);
				var gTemp:Float = fromNode.G + traversalCost;
				if (gTemp < node.G)
				{
					node.parentNode = fromNode;
					walkableNodes.push(node);
				}
			}
			else
			{
				// If it's untested, set the parent and flag it as 'Open' for consideration
				node.parentNode = fromNode;
				node.state = NodeState.Open;
				walkableNodes.push(node);
			}
		}

		return walkableNodes;
	}
}

class Node {
    public var location:Point;
    public var isWalkable:Bool;
    public var G:Float;
    public var H:Float;
	public var F(get, null):Float;
    public var state:NodeState = NodeState.Untested;
    @:isVar public var parentNode(default, set):Node;
	
    function get_F():Float {
		return G + H;
    }
	
	function set_parentNode(value:Node) { 
		G = value.G + Point.distance(location, value.location);
		parentNode = value;
		
		return value;
	}
	
	public function new(x:Int, y:Int, isWalkable:Bool, endLocation:Point)
	{
		location = new Point(x, y);
		this.isWalkable = isWalkable;
		this.H = Point.distance(location, endLocation);
		this.G = 0;
	}

	public function toString():String
	{
		return location.x + ", " + location.y + ":" + state;
	}
}
 
enum NodeState { Untested; Open; Closed; }