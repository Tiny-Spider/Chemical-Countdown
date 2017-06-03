package screens;


import openfl.Lib;
import openfl.display.Stage;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFieldAutoSize;
import screens.ScreenManager.ScreenType;

/**
 * Game Screen
 */
class GameScreen extends Screen
{

	public function new() 
	{
		super();
		trace("Game screen loaded");
		screenType = ScreenType.Game;
	}
	
	public function  UpdateUI(){
		
	}
	
	public override function OnLoad(){
		
		var scoreText : TextField = new TextField();
		var scoreTextFormat : TextFormat = new TextFormat();
		
		scoreTextFormat.size = 24;
		scoreTextFormat.bold = true;
		scoreTextFormat.font = "fonts/zero hour.ttf";
		
		
		
		scoreText.width = 300;
		
		scoreText.x = 10;
		scoreText.y = 10;
		scoreText.border = false;
		scoreText.text = "Score: ";
		scoreText.borderColor = 0x80FF00;
		scoreText.textColor = 0x80FF00;
		scoreText.selectable = false;
		
		scoreText.setTextFormat(scoreTextFormat);
		addChild(scoreText);
		
		
		var timerText : TextField = new TextField();
		timerText.height = 24;
		
		timerText.autoSize = TextFieldAutoSize.RIGHT;
		timerText.x = stage.stageWidth - timerText.width ;
		timerText.y = 10;
		timerText.text = "Timer: ";
		timerText.textColor = 0x80FF00;
		timerText.selectable = false;
		timerText.setTextFormat(scoreTextFormat);
		addChild(timerText);
	}
}