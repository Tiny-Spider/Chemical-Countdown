package screens;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import screens.ScreenManager.ScreenType;
import openfl.display.Stage;
import openfl.Lib;

/**
 * Base Screen Class
 */
class InGameMenu extends Sprite
{
	public var myStage: Stage;
	var screen : Screen;

	public function new(_screen: Screen) 
	{
		super();
		screen = _screen;
		
		myStage = Lib.current.stage;
		Main.getInstance().addChild(this);
		OnLoad();
	}
	
	function OnLoad(){
		var buttonCount : Int = 0;
		//var sprite : Sprite = new Sprite();
		//addChild(sprite);
		
		var background : Bitmap = new Bitmap(Assets.getBitmapData("img/UI/InGameMenu.png"));
		background.x = (myStage.stageWidth / 2) - (background.width / 2);
		background.y = (myStage.stageHeight / 2) - (background.height / 2);
		
		
		//sprite.x = background.x;
		//sprite.y = background.y;
		//sprite.width = background.width;
		//sprite.height = background.height;
		
		addChild(background);
		var newButton : Button = new Button(Assets.getBitmapData("img/UI/Resume1.png"), Assets.getBitmapData("img/UI/Resume2.png"), Assets.getBitmapData("img/UI/Resume3.png"), Resume);
		
		newButton.x = (myStage.width /2) - (newButton.width /2) - 35;
		newButton.y = (background.y + 100) + ((newButton.height *1)* buttonCount);
		addChild(newButton);
		buttonCount++;
		
		newButton = new Button(Assets.getBitmapData("img/UI/Restart1.png"), Assets.getBitmapData("img/UI/Restart2.png"), Assets.getBitmapData("img/UI/Restart3.png"), Resume);
		
		newButton.x = (myStage.width /2) - (newButton.width /2) - 35;
		newButton.y = (background.y + 100) + ((newButton.height *1)* buttonCount);
		addChild(newButton);
		buttonCount++;
		//
		newButton = new Button(Assets.getBitmapData("img/UI/Exit1.png"), Assets.getBitmapData("img/UI/Exit2.png"), Assets.getBitmapData("img/UI/Exit3.png"), Quit);
		
		newButton.x = (myStage.width /2) - (newButton.width /2) - 35;
		newButton.y = (background.y + 100) + ((newButton.height *1)* buttonCount);
		addChild(newButton);
		buttonCount++;
	}
	
	function Resume(){
		screen.removeChild(this);
		trace(cast(screen, GameScreen).inGameMenuOpen);
		cast(screen, GameScreen).inGameMenuOpen = false;
		trace(cast(screen, GameScreen).inGameMenuOpen);
	}
	
	function Restart(){
		//Restart level here.
	}
	
	function Quit(){
		Main.getInstance().screenManager.LoadScreen(ScreenType.Title);
	}
}