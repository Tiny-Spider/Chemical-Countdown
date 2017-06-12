package;

import flash.display.Bitmap;
import ChemicalManager.ChemicalColor;
import ChemicalManager.ChemicalShape;
import DisposalType;

/**
 * ...
 * @author Gin
 */
class Chemical
{
	private var sprite : Bitmap;

	private var name:String;
	private var color:ChemicalColor;
	private var shape:ChemicalShape;
	private var disposalType:DisposalType;

	public function new(name:String, color:ChemicalColor, shape:ChemicalShape, disposalType:DisposalType)
	{
		this.name = name;
		this.color = color;
		this.shape = shape;
		this.disposalType = disposalType;
		
		// sprite = * get the sprite from Assets.getbitmap
	}
	
	public function getDisposalType():DisposalType {
		return disposalType;
	}

}