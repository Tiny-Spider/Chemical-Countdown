package;

import lime.Assets;

/**
 * ...
 * @author Gin
 */
class ChemicalManager
{

	//var dataSetPath : String = "data/Chemical list.xml";
	//public function new()
	//{
	//var xml : Xml = Xml.parse(Assets.getText("data/Chemical list.txt")).firstElement();
	//trace(xml);
	//
	//trace("FIRST CHILD: " + xml.firstElement().nodeName);
	//
	//var count : Int = 0;
	//for (child in xml.elements()){
	//for (subChild in child.firstChild()){
	////trace(subChild.nodeValue);
	//trace(subChild.nodeName);
	//}
	//count++;
	//}
	//trace("ITERATION COUNT = " + count);
	//}

	private var chemicalList:Array<Chemical> = new Array<Chemical>();

	public function new()
	{
		CreateChemicalList();
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