package screens;


import flash.display.Bitmap;
import flash.display.BitmapData;
import openfl.Lib;
import openfl.Assets;
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
	
	public override function OnLoad()
	{
		var scoreTextFormat : TextFormat = new TextFormat();
		scoreTextFormat.size = 24;
		scoreTextFormat.bold = true;
		scoreTextFormat.font = "fonts/zero hour.ttf";
		
		
		var scoreText : TextField = new TextField();
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
		timerText.x = Lib.current.stage.stageWidth - timerText.width ;
		timerText.y = 10;
		timerText.text = "Timer: ";
		timerText.textColor = 0x80FF00;
		timerText.selectable = false;
		timerText.setTextFormat(scoreTextFormat);
		addChild(timerText);
		
		//Draw menu button
		var menuButton : Button = new Button(Assets.getBitmapData("img/UI/XButton1.png"), Assets.getBitmapData("img/UI/XButton2.png"), Assets.getBitmapData("img/UI/XButton3.png"), MenuButton);
		
		menuButton.x = -75;
		menuButton.y = menuButton.height /4;
		addChild(menuButton);
	}
	
	function MenuButton(){
		Main.getInstance().screenManager.LoadLastScreen();
		//var bitmapData : BitmapData; = Assets.getBitmapData("img/UI/InGameMenu.png");
		//var inGameMenu : Bitmap = bitmapData;
		//inGameMenu.x = (myStage.stageWidth / 2) - (inGameMenu.width / 2);
		//inGameMenu.y = (myStage.stageHeight / 2) - (inGameMenu.height / 2);
	}
}