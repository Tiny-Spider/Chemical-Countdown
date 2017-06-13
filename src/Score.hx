package src;

/**
 * ...
 * @author Gin
 */
class Score 
{
	private static var instance : Score;
	public var score : Int = 0;
	public var scorePerChemical = 10;
	var callback : Void -> Void;
	
	public function new() 
	{
		instance = this;
	}
	
	public static function GetInstance():Score
	{
		return instance;
	}
	
	public function ResetScore(){
		score = 0;
		if (callback != null){
			callback();
		}
		
	}
	
	public function ChangeScore(amount : Int){
		score += amount;
		if (callback != null){
			callback();
		}
	}
	
	public function setCallBack(callback:Void->Void){
		this.callback = callback;
	}
	
	
}