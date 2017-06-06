package screens;

import openfl.Assets;
import openfl.Lib;
import openfl.display.Stage;
import openfl.text.TextField;
import screens.ScreenManager.ScreenType;

/**
 * Leaderboard Screen
 */
class LeaderboardScreen extends Screen
{

	public function new() 
	{
		super();
		trace("Leaderboardscreen loaded");
		screenType = ScreenType.Leaderboard;
	}
	
	public override function OnLoad(){
		var backButton : Button = new Button(Assets.getBitmapData("img/UI/Back1.png"), Assets.getBitmapData("img/UI/Back2.png"), Assets.getBitmapData("img/UI/Back3.png"), Back);
		
		backButton.x = -75;
		backButton.y = 0 + myStage.stageHeight - backButton.height;
		addChild(backButton);
	}
	
	function Back(){
		Main.get_instance().screenManager.LoadLastScreen();
	}
	
}