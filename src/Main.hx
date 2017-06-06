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
	private static var instance:Main;
	private static var tileManager:TileManager;
	
	public var screenManager:ScreenManager;
	public var leaderBoards:Leaderboards;
	
	private var demoLevelBackground:Array<Array<Int>> = [
		[ 0,  1,  1,  1,  2],
		[ 3,  4,  4,  4,  5],
		[ 3,  4,  4,  4,  5],
		[ 3,  4,  4,  4,  5],
		[ 6,  7,  7,  7,  8]
		];
	
	private var demoLevelForeground:Array<Array<Int>> = [
		[-1, -1, -1, -1, -1],
		[-1, -1, -1, -1, -1],
		[-1, -1, -1, -1, -1],
		[-1, -1, -1, -1, -1],
		[-1,  9, 10, 11, -1]
		];
	
	public function new(){
		super();
		
		instance = this;
		tileManager = new TileManager();
		
		screenManager = new ScreenManager();
		leaderBoards = new Leaderboards();
		
		LoadScreen();
		
		addChild(new Level(demoLevelBackground, demoLevelForeground));
		
		new PathfinderTest();
	}
	
	public static function getInstance():Main
	{
		return instance;
	}
	
	public static function getTileManager():TileManager {
		return tileManager;
	}
	
	public function LoadScreen(){
		screenManager.LoadScreen(ScreenType.Title);
	}
}
