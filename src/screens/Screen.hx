package screens;

import openfl.display.Sprite;
import screens.ScreenManager.ScreenType;

/**
 * Base Screen Class
 */
class Screen extends Sprite
{
	public var screenType:ScreenType;

	public function new() 
	{
		super();
		OnLoad();
		
		if (Main.getInstance().numChildren != 0){
			Main.getInstance().removeChildren();
		}
		
		Main.getInstance().addChild(this);
	}
	
	public function OnLoad(){
		
	}
	
	public function OnDestroy(){
		
	}
}