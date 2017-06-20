//: [Previous](@previous)

import Foundation

//	Data Model

enum PlayPosition: Int {
	case keeper = 0
	case defender
	case midfielder
	case forward
}

typealias Player = (
	name: String,
	shirtNumber: Int,
	position: PlayPosition,
	numberOfYellowCards: Int,
	hasRedCard: Bool
)

var player = Player(name: "Brat Pantela",
                    shirtNumber: 10,
                    position: .forward,
                    numberOfYellowCards: 0,
                    hasRedCard: false
)


typealias Team = (
	name: String,
	players: [Player]
)

var team = Team(name: "Srbija",
                players: []
)





//	BOTTOM->UP, LEAF->ROOT pristup
//	izbegavati nepotrebne informacije u modelu tipova podataka

//	teamName je višak
typealias player2 = (playerName: String, teamName: String, playerPosition: PlayPosition, dressNumber: Int, hasYellowCard: Int, hasRedCard: Bool)

typealias team2 = (name: String, players: [player2])














//	replikacija postojećih funkcionalnosti

func listOfPlayers(team : Team) -> [Player] {
	var result = [Player]()

	for element in team.players {
		result.append(element)
	}
	return result
}
//	ova funkcija daje samo kopiju onoga što već postoji u team.players








//	RE-FACTORING

func isPlayerEligableforMatch(player: Player) -> Bool {
	if(player.hasRedCard || player.numberOfYellowCards >= 3) {
		return false}

	return true
}

func listPlayersStartingMatch(startingTeam: Team) -> [Player] {
	var arr = [Player] ()
	for player in startingTeam.players {
		if isPlayerEligableforMatch(player: player) {
			arr.append(player)
		}
	}
	return arr
}

func checkNumberOfPlayers(team: Team) -> Bool {

	let players = listPlayersStartingMatch(startingTeam: team)
	return (players.count >= 12) && (players.count <= 16)
}

func isMatchPlayable(team1: Team, team2: Team) -> Bool {
	if (checkNumberOfPlayers(team: team1) && checkNumberOfPlayers(team: team2))
	{
		return true
	}

	return false
}














/*





class team1 {

	var Buffon:Player = (
		name:"Buffon",
		number:3,
		yellowCard:1,
		redCard:false,
		position:.goalKeeper
	)
	var player2:Player = (
		name:"Iniesta",
		number:2,
		yellowCard:0,
		redCard:true,
		position: .defender
	)

	init() {
		self.Buffon
		self.player2
		self.isAvebiableForPlay(player: player2)

	}
	func isAvebiableForPlay(player:Player) -> String {
		if(player.redCard == true) {
			return("Player \(player.name) cant play")
		} else if(player.yellowCard == 3) {
			return("Player \(player.name) cant play")
		}
		return("")
	}

}
*/



//: [Next](@next)
