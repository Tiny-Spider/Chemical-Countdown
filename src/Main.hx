package;

import openfl.Lib;
import openfl.display.Tilemap;
import tiles.TileManager;

import openfl.display.FPS;
import openfl.display.Sprite;

import screens.Screen;
import screens.ScreenManager;
import screens.TitleScreen;

/**
 * Main class of the program
 */
class Main extends Sprite 
{
	public static var instance: Main;
	public static var tileManager:TileManager;
	
	public var screenManager: ScreenManager;
	public var leaderBoards: Leaderboards;
	
	public function new(){
		super();
		
		tileManager = new TileManager();
		
		LoadScreen();
		
		screenManager = new ScreenManager();
		leaderBoards = new Leaderboards();
		
		addChild(new Level());
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
