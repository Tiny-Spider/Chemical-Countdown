package items;

import items.Item;
import openfl.display.Bitmap;
import openfl.utils.Assets;
import tiles.TileManager;

/**
 * ...
 * @author Mark
 */
class ItemChemical extends Item
{
	private var chemical:Chemical;

	public function new(chemical:Chemical) 
	{
		super();
		
		this.chemical = chemical;
		
		image = new Bitmap(Assets.getBitmapData("img/chem.png"));
		
		image.height = TileManager.tileSize;
		image.width = TileManager.tileSize;
		
		//image.x = -(TileManager.tileSize / 2);
		//image.y = -(TileManager.tileSize / 2);
		
		setVisible(true);
	}
	
	public function getChemical():Chemical {
		return chemical;
	}
	
}