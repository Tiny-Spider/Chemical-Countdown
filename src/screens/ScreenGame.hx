package screens;

import items.Item;
import levels.Level;
import levels.LevelData;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.Lib;
import openfl.Assets;
import openfl.display.Stage;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFieldAutoSize;
import screens.ScreenManager.ScreenType;
import screens.ScreenGameMenu;
import src.Score;
import util.FPS_Mem;

/**
 * Game Screen
 */
class ScreenGame extends Screen
{
	public var inGameMenuOpen : Bool = false;
	
	private var score : Score;
	private var inGameMenu : ScreenGameMenu;

	private var scoreText : TextField = new TextField();
	private var timerText : TextField = new TextField();
	
	private var itemImage : Bitmap = new Bitmap();
	private var itemText : TextField = new TextField();

	public function new()
	{
		super();
		
		trace("Game screen loaded");
		screenType = ScreenType.Game;
		score = Score.getInstance();
		score.setCallBack(updateUI);
		
		onLoad();
	}

	private function updateUI()
	{
		scoreText.text = "Score: " + Score.getInstance().score;
	}

	// Load of the UI
	public override function onLoad()
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
		var menuButton : Button = new Button(Assets.getBitmapData("img/UI/XButton1.png"), Assets.getBitmapData("img/UI/XButton2.png"), Assets.getBitmapData("img/UI/XButton3.png"), menuButton);

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
		
		var fps_mem:FPS_Mem = new FPS_Mem(10, 10, 0xffffff);
		addChild(fps_mem);

		loadLevel();
	}
	
	private function loadLevel() {
		var leveldata:LevelData = Main.getLevelManager().getLevel(0);
		var level:Level = new Level(leveldata);
		
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
	private function menuButton()
	{
		if (inGameMenuOpen)
		{
			this.removeChild(inGameMenu);
			inGameMenuOpen = false;
		}
		else
		{
			inGameMenuOpen = true;
			inGameMenu = new ScreenGameMenu(this);
			addChild(inGameMenu);
		}
	}

	// When the object gets destroyed.
	public override function onDestroy()
	{
		score = null;
	}
}