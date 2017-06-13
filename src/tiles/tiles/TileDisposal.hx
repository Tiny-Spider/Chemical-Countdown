package tiles.tiles;

import items.ItemChemical;
import DisposalType;

/**
 * ...
 * @author Mark
 */
class TileDisposal extends TileBase implements IInteractable
{
	private var disposalType:DisposalType;

	public function new(x:Float, y:Float, type:Int, level:Level, disposalType:DisposalType) 
	{
		super(x, y, type, level, false);
		
		this.disposalType = disposalType;
	}
	
	public function getDisposalType():DisposalType 
	{
		return disposalType;
	}
	
	public function interact(player:Player) {
		if (Std.is(player.getItem(), ItemChemical)) {
			var item:ItemChemical = cast(player.getItem(), ItemChemical);
			
			if (item.getChemical().getDisposalType() == disposalType) {
				// Add score
			}
			else {
				// Explode?
			}
		}
	}
	
	public override function createNew(level:Level):TileBase {
		var tile = new TileDisposal (x, y, id, level, disposalType);
		tile.matrix = matrix.clone ();
		tile.tileset = tileset;
		return tile;
	}
}