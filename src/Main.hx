package;

import openfl.display.FPS;
import openfl.display.Sprite;
import openfl.Lib;
import screens.Screen;
import screens.ScreenManager;
import screens.TitleScreen;



/**
 * ...
 * @author Gin
 */
class Main extends Sprite 
{
	public static var instance: Main;
	
	public var screenManager: ScreenManager;
	public var leaderBoards: Leaderboards;
	
	public function new(){
		super();
		LoadScreen();
		
		screenManager = new ScreenManager();
		leaderBoards = new Leaderboards();
	}
	
	public static function get_instance():Main
	{
		return instance;
	}
	
	public function LoadScreen(){
		var currentScreen : Screen;
		
		currentScreen = new TitleScreen();
		addChild(currentScreen);
	}
}
