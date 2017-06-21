package screens;

import openfl.Lib;
import openfl.display.Stage;
import openfl.text.TextField;
import screens.ScreenManager.ScreenType;

/**
 * Menu Screen
 */
class ScreenMenu extends Screen
{

	public function new() 
	{
		super();
		trace("Menu screen loaded");
		screenType = ScreenType.Menu;
	}
	
	public override function onLoad(){
		
	}
}