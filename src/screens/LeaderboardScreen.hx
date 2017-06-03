package screens;

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
		trace("Titlescreen loaded");
		screenType = ScreenType.Title;
	}
	
	public override function OnLoad(){
		
	}
	
}