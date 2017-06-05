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