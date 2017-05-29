package screens;

import screens.ScreenManager.ScreenType;

/**
 * Manages all screens
 */
class ScreenManager 
{
	var currentScreen : Screen;
	
	public function new() 
	{
		currentScreen = new Screen();
	}
	
	public function LoadScreen(screenType : ScreenType){
		switch(screenType){
			case ScreenType.Title:
				currentScreen = new TitleScreen();
			case ScreenType.Menu:
				currentScreen = new MenuScreen();
			case ScreenType.Game:
				currentScreen = new GameScreen();
			//case ScreenType.leaderboardScreen:
				////currentScreen = new LeaderboardsScreen();
			default:
				trace("No screen");
		}
		
		
	}
	
}

enum ScreenType {
	Title;
	Menu;
	Game;
	Leaderboard;
}