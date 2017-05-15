package screens;
import openfl.Lib;
import openfl.display.Stage;
import openfl.text.TextField;
/**
 * ...
 * @author Gin
 */
class TitleScreen extends Screen
{

	public function new() 
	{
		super();
		trace("Titlescreen loaded");
		OnLoad();
	}
	
	public override function OnLoad(){
		
		var scoreTextField:TextField = new TextField();
		var myStage : Stage = Lib.current.stage;
		
		
		scoreTextField.width = 100;
		scoreTextField.x = (myStage.stageWidth * 0.5) - (scoreTextField.width * 0.5);
		scoreTextField.y = (myStage.stageHeight * 0.5) - (scoreTextField.height * 0.5);
		scoreTextField.border = true;
		scoreTextField.borderColor = 0x80FF00;
		scoreTextField.text = "Title screen";
		scoreTextField.textColor = 0x80FF00;
		addChild(scoreTextField);
		
		
	}
	
}