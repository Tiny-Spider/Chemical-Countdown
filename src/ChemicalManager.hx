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
	
	
	public var chemicalList : Array<Chemical> = new Array<Chemical>();
	
	public function new(){
		CreateChemicalList();
	}
	
	//temp
	function CreateChemicalList(){
		var chemical : Chemical;
		
		chemical = new Chemical();
		chemical.name = "Sulphuric Acid";
		chemical.color = RED;
		chemical.shape = TRIANGLE;
		chemicalList.push(chemical);
		
		chemical = new Chemical();
		chemical.name = "Hydrochloric Acid";
		chemical.color = RED;
		chemical.shape = ROUND;
		chemicalList.push(chemical);
		
		chemical = new Chemical();
		chemical.name = "Nitric Acid";
		chemical.color = RED;
		chemical.shape = SQUARE;
		chemicalList.push(chemical);
		
		chemical = new Chemical();
		chemical.name = "Sodium Hydroxide";
		chemical.color = GREEN;
		chemical.shape = TRIANGLE;
		chemicalList.push(chemical);
		
		chemical = new Chemical();
		chemical.name = "potassium Hydroxide";
		chemical.color = GREEN;
		chemical.shape = ROUND;
		chemicalList.push(chemical);
		
		chemical = new Chemical();
		chemical.name = "Lithium Hydroxide";
		chemical.color = GREEN;
		chemical.shape = SQUARE;
		chemicalList.push(chemical);
		
		chemical = new Chemical();
		chemical.name = "Ethanol";
		chemical.color = BLUE;
		chemical.shape = TRIANGLE;
		chemicalList.push(chemical);
		
		chemical = new Chemical();
		chemical.name = "Methanol";
		chemical.color = BLUE;
		chemical.shape = ROUND;
		chemicalList.push(chemical);
		
		chemical = new Chemical();
		chemical.name = "Acetone";
		chemical.color = BLUE;
		chemical.shape = SQUARE;
		chemicalList.push(chemical);
		
		chemical = new Chemical();
		chemical.name = "Chlorine";
		chemical.color = PURPLE;
		chemical.shape = TRIANGLE;
		chemicalList.push(chemical);
		
		chemical = new Chemical();
		chemical.name = "Fluorine";
		chemical.color = PURPLE;
		chemical.shape = ROUND;
		chemicalList.push(chemical);
		trace(chemicalList);
		
		chemical = new Chemical();
		chemical.name = "Bromine";
		chemical.color = PURPLE;
		chemical.shape = SQUARE;
		chemicalList.push(chemical);
		
		chemical = new Chemical();
		chemical.name = "Sodium Chloride";
		chemical.color = YELLOW;
		chemical.shape = TRIANGLE;
		chemicalList.push(chemical);
		
		chemical = new Chemical();
		chemical.name = "Silver Nitrate";
		chemical.color = YELLOW;
		chemical.shape = ROUND;
		chemicalList.push(chemical);
		
		chemical = new Chemical();
		chemical.name = "Mercuric Chloride";
		chemical.color = YELLOW;
		chemical.shape = SQUARE;
		chemicalList.push(chemical);
	}
	
	public function GetChemical(){
		var randomNr: Int =  Math.round(Math.random() * chemicalList.length);
		var newChemical : Chemical = new Chemical();
		
		newChemical.color = chemicalList[randomNr].color;
		newChemical.name = chemicalList[randomNr].name;
		newChemical.shape = chemicalList[randomNr].shape;
		
		return newChemical;
	}
}

 enum Shape{
	TRIANGLE;
	ROUND;
	SQUARE;
}

enum Color{
	RED;
	BLUE;
	GREEN;
	YELLOW;
	PURPLE;
}