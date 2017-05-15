package screens;
import screens.ScreenManager.ScreenType;

/**
 * ...
 * @author Gin
 */
class ScreenManager 
{
	var currentScreen : Screen;
	
	public function new() 
	{
		
	}
	
	public function LoadScreen(screenType : ScreenType){
		switch(screenType){
			case ScreenType.titleScreen:
				currentScreen = new TitleScreen();
			case ScreenType.menuScreen:
				currentScreen = new MenuScreen();
			case ScreenType.gameScreen:
				currentScreen = new GameScreen();
			//case ScreenType.leaderboardScreen:
				//currentScreen = new LeaderboardsScreen();
			default:
				trace("No screen");
		}
		
		
	}
	
}

enum ScreenType{
	titleScreen;
	menuScreen;
	gameScreen;
	leaderboardScreen;
}