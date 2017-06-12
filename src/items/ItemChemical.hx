package items;

import items.Item;

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
	}
	
	public function getChemical():Chemical {
		return chemical;
	}
	
}