package;

import lime.Assets;

/**
 * ...
 * @author Gin
 */
class ChemicalManager
{
	private var chemicalList:Array<Chemical> = new Array<Chemical>();
	private static var instance : ChemicalManager;
	
	
	public function new()
	{
		instance = this;
		CreateChemicalList();
	}
	public static function GetInstance():ChemicalManager{
		return instance;
	}
	
	//temp
	private function CreateChemicalList()
	{
		chemicalList.push(new Chemical("Sulphuric Acid", RED, TRIANGLE, DisposalType.ACIDIC));
		chemicalList.push(new Chemical("Hydrochloric Acid", RED, ROUND, DisposalType.ACIDIC));
		chemicalList.push(new Chemical("Nitric Acid", RED, SQUARE, DisposalType.ACIDIC));
		chemicalList.push(new Chemical("Sodium Hydroxide", GREEN, TRIANGLE, DisposalType.ACIDIC));
		chemicalList.push(new Chemical("potassium Hydroxide", GREEN, ROUND, DisposalType.ACIDIC));
		chemicalList.push(new Chemical("Lithium Hydroxide", GREEN, SQUARE, DisposalType.ACIDIC));
		chemicalList.push(new Chemical("Ethanol",BLUE,TRIANGLE, DisposalType.ACIDIC));
		chemicalList.push(new Chemical("Methanol",BLUE,ROUND, DisposalType.ACIDIC));
		chemicalList.push(new Chemical("Acetone",BLUE,SQUARE, DisposalType.ACIDIC));
		chemicalList.push(new Chemical("Chlorine",PURPLE,TRIANGLE, DisposalType.ACIDIC));
		chemicalList.push(new Chemical("Fluorine",PURPLE,ROUND, DisposalType.ACIDIC));
		chemicalList.push(new Chemical("Bromine",PURPLE,SQUARE, DisposalType.ACIDIC));
		chemicalList.push(new Chemical("Sodium Chloride",YELLOW,TRIANGLE, DisposalType.ACIDIC));
		chemicalList.push(new Chemical("Silver Nitrate",YELLOW,ROUND, DisposalType.ACIDIC));
		chemicalList.push(new Chemical("Mercuric Chloride",YELLOW,SQUARE, DisposalType.ACIDIC));
	}

	public function GetRandomChemical():Chemical
	{
		return chemicalList[Math.round(Math.random() * chemicalList.length)];
	}
}

enum ChemicalShape
{
	TRIANGLE;
	ROUND;
	SQUARE;
}

enum ChemicalColor
{
	RED;
	BLUE;
	GREEN;
	YELLOW;
	PURPLE;
}