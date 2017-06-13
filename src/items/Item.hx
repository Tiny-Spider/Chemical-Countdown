package items;
import openfl.display.Bitmap;
import openfl.display.Sprite;

/**
 * ...
 * @author Mark
 */
class Item extends Sprite
{
	private var image:Bitmap;

	public function new() 
	{
		super();
	}
	
	public function setVisible(visible:Bool) {
		if (image == null) return;
		
		if (visible) {
			addChild(image);
		} else {
			removeChild(image);
		}
	}
	
}