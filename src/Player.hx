package;
import openfl.display.Sprite;
import openfl.Assets;
import openfl.display.Bitmap;

/**
 * ...
 * @author Mark
 */
class Player extends Sprite
{
	private var playerSprite:Bitmap;
	
	public function new() 
	{
		super();
		
		playerSprite = new Bitmap(Assets.getBitmapData("img/player.png"));
		
		playerSprite.height = 64;
		playerSprite.width = 64;
		
		addChild(playerSprite);
	}
	
}