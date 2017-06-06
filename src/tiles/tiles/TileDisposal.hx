package tiles.tiles;

/**
 * ...
 * @author Mark
 */
class TileDisposal extends TileBase
{
	private var disposalType:DisposalType;

	public function new(x:Float, y:Float, type:Int, disposalType:DisposalType) 
	{
		super(x, y, type, false);
		
		this.disposalType = disposalType;
	}
	
}

enum DisposalType {
	Acid
}