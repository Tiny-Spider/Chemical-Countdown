package src;

/**
 * ...
 * @author Gin
 */
class Score 
{
	public static inline var scoreCorrectDisposal = 10;
	public static inline var scoreIncorrectDisposal = -5;
	
	private static var instance : Score;
	
	public var score : Int = 0;
	
	private var callback : Void -> Void;
	
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