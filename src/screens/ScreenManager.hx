package screens;

import screens.ScreenManager.ScreenType;

/**
 * Manages all screens
 */
class ScreenManager 
{
	public var currentScreen : Screen;
	public var lastScreen : Screen;
	
	public function new() 
	{
		currentScreen = new Screen();
	}
	
	public function LoadScreen(screenType : ScreenType){
		lastScreen = currentScreen;
		
		switch(screenType){
			case ScreenType.Title:
				currentScreen = new TitleScreen();
			case ScreenType.Menu:
				currentScreen = new MenuScreen();
			case ScreenType.Game:
				currentScreen = new GameScreen();
			case ScreenType.Leaderboard:
				currentScreen = new LeaderboardScreen();
			default:
				trace("No screen");
		}
		
		
	}
	
	public function LoadLastScreen(){
		
	}
	
}

enum ScreenType {
	Title;
	Menu;
	Game;
	Leaderboard;
}