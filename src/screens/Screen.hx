package screens;

import flash.display.Stage;
import openfl.Lib;
import openfl.display.Sprite;
import screens.ScreenManager.ScreenType;

/**
 * Base Screen Class
 */
class Screen extends Sprite
{
	public var screenType : ScreenType;
	
	var myStage : Stage;
	
	public function new() 
	{
		super();
		OnLoad();
		
		if (Main.get_instance().numChildren != 0){
			Main.get_instance().removeChildren();
		}
		
		Main.get_instance().addChild(this);
		myStage = Lib.current.stage;
	}
	
	public function OnLoad(){
		
	}
	
	public function OnDestroy(){
		
	}
}