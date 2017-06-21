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
	
	public function new() 
	{
		instance = this;
	}
	
	public static function getInstance():Score
	{
		return instance;
	}
	
	public function resetScore(){
		score = 0;
		if (callback != null){
			callback();
		}
		
	}
	
	public function changeScore(amount : Int){
		score += amount;
		if (callback != null){
			callback();
		}
	}
	
	public function setCallBack(callback:Void->Void){
		this.callback = callback;
	}
	
	
}