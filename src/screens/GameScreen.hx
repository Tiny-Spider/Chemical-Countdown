package screens;


import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.Lib;
import openfl.Assets;
import openfl.display.Stage;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFieldAutoSize;
import screens.ScreenManager.ScreenType;
import screens.InGameMenu;
import src.Score;
import openfl.display.Sprite;

/**
 * Game Screen
 */
class GameScreen extends Screen
{
	var score : Score;
	public var inGameMenuOpen : Bool = false;
	var inGameMenu : InGameMenu;
	
	var scoreText : TextField = new TextField();

	public function new() 
	{
		super();
		trace("Game screen loaded");
		screenType = ScreenType.Game;
		score = Score.GetInstance();
		score.setCallBack(UpdateUI);
		OnLoad();
	}
	
	function  UpdateUI(){
		scoreText.text = "Score: " + Score.GetInstance().score;
	}
	
	//Load of the UI
	public override function OnLoad()
	{
		var sprite : Sprite = new Sprite();
		
		
		
		
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
		
		trace(" Score" + score.score);
		score.ChangeScore(50);
	}
	
	//Interaction with the in game menu button.
	function MenuButton(){
		if (inGameMenuOpen){
			this.removeChild(inGameMenu);
			inGameMenuOpen = false;
		}
		else{
			inGameMenuOpen = true;
			inGameMenu = new InGameMenu(this);
			addChild(inGameMenu);
		}
	}
	
	//WHen the object gets destroyed.
	public override function OnDestroy(){
		score = null;
	}
}