package;
import openfl.display.Sprite;
import openfl.Assets;
import openfl.display.Bitmap;
import util.Point;
import tiles.TileManager;
import motion.Actuate;
import motion.easing.Linear;

/**
 * ...
 * @author Mark
 */
class Player extends Sprite
{
	private var playerSprite:Bitmap;
	private var path:Array<Point>;
	private var navigating:Bool = false;
	
	public function new() 
	{
		super();
		
		playerSprite = new Bitmap(Assets.getBitmapData("img/player.png"));
		
		playerSprite.height = 64;
		playerSprite.width = 64;
		
		addChild(playerSprite);
	}
	
	public function setPath(path:Array<Point>) {
		this.path = path;
		this.path.reverse();
		
		if (!navigating) {
			navigateNextPoint();
		}
	}
	
	private function navigateNextPoint() {
		if (path == null || path.length <= 0) {
			navigating = false;
			return;
		}
		
		var point:Point = path.pop();
		
		if (point != null) {
			navigating = true;
		
			var x:Int = point.x * TileManager.tileSize;
			var y:Int = point.y * TileManager.tileSize;
			
			Actuate.tween(this, 1.0, { x:x, y:y }).ease(Linear.easeNone).onComplete(navigateNextPoint);
		}
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
	
}