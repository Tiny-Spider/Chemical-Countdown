package;

import sys.db.Sqlite;
import sys.db.ResultSet;
import sys.db.Connection;

/**
 * LLocal leaderboard class
 */
class Leaderboards 
{
	var connection:Connection;
	
	public function new() 
	{
		OpenConnection();
		
		var resultSet:ResultSet = connection.request("SELECT * FROM highscores");
		
		for (row in resultSet){
			trace(row.name);
		}
		
	}
	
	function OpenConnection(){
		connection = Sqlite.open("data/database.db");
	}
	
	function CloseConnection(){
		connection.close();
	}

	
}