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
	
	public function new(callback : Void -> Void) 
	{
		instance = this;
		this.callback = callback;
	}
	
	public static function GetInstance():Score
	{
		return instance;
	}
	
	public function ResetScore(){
		score = 0;
		callback();
	}
	
	public function ChangeScore(amount : Int){
		score += amount;
		callback();
	}
	
	
}