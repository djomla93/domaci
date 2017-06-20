//: [Previous](@previous)

import Foundation


enum PlayPosition: Int {
	case keeper = 0
	case defender
	case midfielder
	case forward
}





typealias Player = [String: Any]
typealias Team = [ Player ]

var p1: Player = ["numOfYellowCards": "3"]


func canPlayerPlay(player: Player ) -> Bool {

	if (player["numOfYellowCards"] as? Int) == 3 { return false }

	return true
}


func canGameStart(team1: Team, team2: Team) -> Bool {

	if team1.count != 11 { return false }
	if team2.count != 11 { return false }

	return true
}



//: [Next](@next)
