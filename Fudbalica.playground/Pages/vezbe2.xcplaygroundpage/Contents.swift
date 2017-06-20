//: [Previous](@previous)

import Foundation


enum PlayPosition: Int {
	case keeper = 0
	case defender
	case midfielder
	case forward
}





typealias Player = (
	dressNum: Int,
	numberOfYellowCards: Int,
	hasRedCard: Bool,
	name: String,
	position: PlayPosition)

typealias Team = [ Player ]

var p1: Player = (dressNum: 1,
                  numberOfYellowCards: 0,
                  hasRedCard: false,
                  name: "Bla Vlah",
                  position: .keeper)


func canPlayerPlay(player: Player ) -> Bool {

	if player.hasRedCard { return false }
	if player.numberOfYellowCards == 3 { return false }

	return true
}

func startingPlayerList(team: Team) -> [Player] {

	var validPlayers = [Player]()
	for p in team {
		if canPlayerPlay(player: p) {
			validPlayers.append(p)
		}
	}

	return validPlayers
}

func canGameStart(team1: Team, team2: Team) -> Bool {

	var team1ValidPlayers = startingPlayerList(team: team1)
	var team2ValidPlayers = startingPlayerList(team: team2)

	if team1ValidPlayers.count != 11 { return false }
	if team2ValidPlayers.count != 11 { return false }

	return true
}



//: [Next](@next)
