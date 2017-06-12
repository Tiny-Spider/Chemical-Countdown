package;
import items.Item;
import openfl.display.Sprite;
import openfl.Assets;
import openfl.display.Bitmap;
import util.Point;
import tiles.TileManager;
import motion.Actuate;
import motion.easing.Linear;
import tiles.tiles.IInteractable;

/**
 * ...
 * @author Mark
 */
class Player extends Sprite
{
	private var playerSprite:Bitmap;
	private var item:Item;
	private var moveSpeed:Float = 0.4;
	
	// Pathfinding
	private var path:Array<Point>;
	private var nextPoint:Point;
	private var interact:IInteractable;
	private var navigating:Bool = false;
	
	public function new() 
	{
		super();
		
		playerSprite = new Bitmap(Assets.getBitmapData("img/player.png"));
		
		playerSprite.height = 64;
		playerSprite.width = 64;
		
		addChild(playerSprite);
	}
	
	// Set or updates the path the player has to move
	public function setPath(path:Array<Point>, interact:IInteractable) {
		this.interact = interact;
		this.path = path;
		this.path.reverse();
		
		if (!navigating) {
			navigateNextPoint();
		}
	}
	
	// Move the character to the next point in the path
	private function navigateNextPoint() {
		// If there is no path or path is empty, end navigation
		if (path == null || path.length <= 0) {
			navigating = false;
			
			// See if we can still interact with something
			if (interact != null) {
				interact.interact(this);
			}
			
			return;
		}
		
		nextPoint = path.pop();
		
		// See if we can move to the next point
		if (nextPoint != null) {
			navigating = true;
		
			var x:Int = nextPoint.x * TileManager.tileSize;
			var y:Int = nextPoint.y * TileManager.tileSize;
			
			// Move towards next point in linear fashion, and call navigateNextPoint after reaching destination
			Actuate.tween(this, moveSpeed, { x:x, y:y }).ease(Linear.easeNone).onComplete(navigateNextPoint);
		}
	}
	
	public function getItem():Item {
		return item;
	}
	
	public function setItem(item:Item) {
		this.item = item;
	}
	
	public function getX():Int {
		return Math.floor(x / TileManager.tileSize);
	}
	
	public function getY():Int {
		return Math.floor(y / TileManager.tileSize);
	}
	
	public function getPoint():Point {
		return new Point(getX(), getY());
	}
	
	public function getNextPoint():Point {
		return nextPoint != null ? nextPoint : getPoint();
	}
}