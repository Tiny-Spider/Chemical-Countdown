package screens;

import openfl.Lib;
import openfl.display.BitmapData;
import openfl.Assets;
import openfl.display.Stage;
import openfl.text.TextField;
import openfl.system.System;
import screens.ScreenManager;

/**
 * Title Screen
 */
class TitleScreen extends Screen
{

	public function new() 
	{
		super();
		trace("Titlescreen loaded");
		screenType = ScreenType.Title;
	}
	
	public override function OnLoad(){
		
		var scoreTextField:TextField = new TextField();
		var myStage : Stage = Lib.current.stage;
		
		//Text field test
		scoreTextField.width = 100;
		scoreTextField.x = (myStage.stageWidth * 0.5) - (scoreTextField.width * 0.5);
		scoreTextField.y = (myStage.stageHeight * 0.5) - (scoreTextField.height * 0.5);
		scoreTextField.border = true;
		scoreTextField.borderColor = 0x80FF00;
		scoreTextField.text = "Title screen";
		scoreTextField.textColor = 0x80FF00;
		//addChild(scoreTextField);
		
		var buttonCount : Int = 0;
		
		//Start button
		var startButton : Button = new Button(Assets.getBitmapData("img/UI/btn_start_up.png"), Assets.getBitmapData("img/UI/btn_start_hover.png"), Assets.getBitmapData("img/UI/btn_start_click.png"), Start);
		
		startButton.x = myStage.stageWidth /2 - (startButton.width /2);
		startButton.y = myStage.stageHeight / 2 - (startButton.height / 2) - (startButton.height * buttonCount);
		addChild(startButton);
		buttonCount++;
		
		var leaderBoardButton : Button = new Button(Assets.getBitmapData("img/UI/btn_quit_up.png"), Assets.getBitmapData("img/UI/btn_quit_hover.png"), Assets.getBitmapData("img/UI/btn_quit_click.png"), Quit);
		
		leaderBoardButton.x = myStage.stageWidth /2 - (leaderBoardButton.width /2);
		leaderBoardButton.y = myStage.stageHeight / 2 - (leaderBoardButton.height / 2  - ( leaderBoardButton.height * buttonCount));
		addChild(leaderBoardButton);
		buttonCount++;
		
		var quitButton : Button = new Button(Assets.getBitmapData("img/UI/btn_quit_up.png"), Assets.getBitmapData("img/UI/btn_quit_hover.png"), Assets.getBitmapData("img/UI/btn_quit_click.png"), Quit);
		
		quitButton.x = myStage.stageWidth /2 - (quitButton.width /2);
		quitButton.y = myStage.stageHeight / 2 - (quitButton.height / 2  - ( quitButton.height * buttonCount));
		addChild(quitButton);
		buttonCount++;
		
		
	}
	
	function Start(){
		trace("Start level");
		Main.get_instance().screenManager.LoadScreen(ScreenType.Game);
	}
	
	function LeaderBoard(){
		Main.get_instance().screenManager.LoadScreen(ScreenType.Leaderboard);
	}
	
	function Quit(){
		trace("Quit game");
		System.exit(0);
	}
}