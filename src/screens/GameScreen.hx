package screens;

import items.Item;
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

/**
 * Game Screen
 */
class GameScreen extends Screen
{
	public var inGameMenuOpen : Bool = false;
	
	private var score : Score;
	private var inGameMenu : InGameMenu;

	private var scoreText : TextField = new TextField();
	private var timerText : TextField = new TextField();
	
	private var itemImage : Bitmap = new Bitmap();
	private var itemText : TextField = new TextField();

	public function new()
	{
		super();
		trace("Game screen loaded");
		screenType = ScreenType.Game;
		score = Score.GetInstance();
		score.setCallBack(UpdateUI);
		OnLoad();
	}

	private function UpdateUI()
	{
		scoreText.text = "Score: " + Score.GetInstance().score;
	}

	// Load of the UI
	public override function OnLoad()
	{
		var bitmap : Bitmap = new Bitmap(Assets.getBitmapData("img/background.png"));
		bitmap.width = Lib.current.stage.stageWidth;
		bitmap.height = Lib.current.stage.stageHeight;
		addChild(bitmap);
		
		var scoreTextFormat : TextFormat = new TextFormat("fonts/zero hour.ttf", 24, 0x80FF00, true);

		// Score
		scoreText.width = 300;
		scoreText.x = 10;
		scoreText.y = 10;
		scoreText.border = false;
		scoreText.text = "Score: ";
		scoreText.borderColor = 0x80FF00;
		scoreText.selectable = false;
		scoreText.setTextFormat(scoreTextFormat);
		
		addChild(scoreText);

		// Timer
		timerText.height = 24;
		timerText.autoSize = TextFieldAutoSize.RIGHT;
		timerText.x = Lib.current.stage.stageWidth - timerText.width - 100;
		timerText.y = 10;
		timerText.text = "Timer: ";
		timerText.selectable = false;
		timerText.setTextFormat(scoreTextFormat);
		
		addChild(timerText);

		// Menu button
		var menuButton : Button = new Button(Assets.getBitmapData("img/UI/XButton1.png"), Assets.getBitmapData("img/UI/XButton2.png"), Assets.getBitmapData("img/UI/XButton3.png"), MenuButton);

		menuButton.x = -75;
		menuButton.y = menuButton.height / 4;
		
		addChild(menuButton);
		
		// Item UI
		itemText.height = 100;
		itemText.width = 500;
		itemText.x = (Lib.current.stage.stageWidth / 2.0) - itemImage.width;
		itemText.y = (Lib.current.stage.stageHeight) - itemText.height;
		itemText.setTextFormat(scoreTextFormat);
		itemText.selectable = false;
		
		itemImage.height = 100;
		itemImage.width = 100;
		itemImage.x = itemText.x + itemImage.width + 30;
		itemImage.y = (Lib.current.stage.stageHeight) - itemImage.height - 30;
		
		addChild(itemText);
		addChild(itemImage);

		loadLevel();
	}
	
	private function loadLevel() {
		var level:Level = Main.getLevelManager().getLevel(0);
		
		level.centerLevel();
		level.player.onItemSwitch = updateItemDisplay;
		
		addChild(level);
	}
	
	private function updateItemDisplay(item:Item) {
		itemText.text = item == null ? "" : item.displayName;
		itemImage.bitmapData = item == null ? null : item.displayImage;
		
		itemImage.height = 100;
		itemImage.width = 100;
		itemImage.x = itemText.x - itemImage.width - 30;
		itemImage.y = (Lib.current.stage.stageHeight) - itemImage.height - 50;
	}

	// Interaction with the in game menu button.
	private function MenuButton()
	{
		if (inGameMenuOpen)
		{
			this.removeChild(inGameMenu);
			inGameMenuOpen = false;
		}
		else
		{
			inGameMenuOpen = true;
			inGameMenu = new InGameMenu(this);
			addChild(inGameMenu);
		}
	}

	// When the object gets destroyed.
	public override function OnDestroy()
	{
		score = null;
	}
}