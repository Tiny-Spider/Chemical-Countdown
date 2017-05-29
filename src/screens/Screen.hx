package screens;

import openfl.display.Sprite;

/**
 * Base Screen Class
 */
class Screen extends Sprite
{

	public function new() 
	{
		super();
		OnLoad();
		
		if (Main.get_instance().numChildren != 0){
			Main.get_instance().removeChildren();
		}
		
		Main.get_instance().addChild(this);
	}
	
	public function OnLoad(){
		
	}
	
	public function OnDestroy(){
		
	}
}