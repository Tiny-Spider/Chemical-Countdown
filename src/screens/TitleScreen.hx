package screens;
import openfl.Lib;
import openfl.Assets;
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
		
		var button : Button = new Button(Assets.getBitmapData("img/Button1.png"), Play);
		button.x = (Lib.current.stage.stageWidth / 100) * 20;
		button.y = (Lib.current.stage.stageHeight / 100 ) *60;
		addChild( button );
	}
	
	private function Play(){
		trace("Play game");
	}
}