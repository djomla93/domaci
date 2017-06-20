//: Playground - noun: a place where people can play

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




//	create/populate teams

func createTeam(named name: String) -> Team {

	var team = Team(name: name, players: [])

	var shirtNum = 1
	repeat {

		var poz : PlayPosition
		switch shirtNum {
		case 1, 12, 22:
			poz = .keeper
		case 2, 3, 4, 5, 13, 17, 18:
			poz = .defender
		case 6, 7, 8, 14, 15, 19, 20:
			poz = .midfielder
		default:
			poz = .forward
		}

		let p = Player(
			name: String(shirtNum) + " " + name,
			position: poz,
			shirtNumber: shirtNum,
			numberOfYellowCards: 0,
			hasRedCard: false
		)
		team.players.append(p)

		shirtNum += 1
	} while (shirtNum <= 22)

	return team
}



//	Player-related functions

func isGoalKeeper(player: Player) -> Bool {

	return (player.position == .keeper)
}


func isGameEligible(player: Player) -> Bool {

	if player.hasRedCard {
		return false
	}

	if (player.numberOfYellowCards == 3) {
		return false
	}

	return true
}

func describe(player: Player) {

	let redCardDesc = player.hasRedCard ? ". Has red card!" : ""
	let yellowCards = player.numberOfYellowCards == 0 ? "" : ". Has \(player.numberOfYellowCards) yellow cards"

	print( "Player \(player.name), #\(player.shirtNumber), position: \(player.position)\(redCardDesc)\(yellowCards)" )

}




//	Team-related functions

//	"vrati" sve igrače koji mogu biti prijavljeni za utakmicu
func findGameEligiblePlayers(team: Team) -> [Player] {

	var p = [Player]()
	for player in team.players {
		if !isGameEligible(player: player) {
			continue
		}
		p.append(player)
	}

	return p
}

//	izaberi tim za prijavu utakmice. min 2 golmana i 14 drugih igrača
func pickGamePlayers(FromEligiblePlayers allPlayers: [Player]) -> [Player] {

	var p = [Player]()
	var goalkeepersCount = 0
	var othersCount = 0

	for player in allPlayers {

		if isGoalKeeper(player: player) {
			if goalkeepersCount == 2 { continue }
			goalkeepersCount += 1
		} else {
			if othersCount == 14 { continue }
			othersCount += 1
		}
		p.append(player)
	}

	return p
}

func pickStartingPlayers(FromPlayers allPlayers: [Player]) -> [Player] {

	var p = [Player]()
	var goalkeepersCount = 0
	var othersCount = 0

	for player in allPlayers {

		if isGoalKeeper(player: player) {
			if goalkeepersCount == 1 { continue }
			goalkeepersCount += 1
		} else {
			if othersCount == 10 { continue }
			othersCount += 1
		}
		p.append(player)
	}

	return p
}

func startingLineup(team: Team) -> [Player] {

	let possiblePlayers = findGameEligiblePlayers(team: team)
	let listedPlayers = pickGamePlayers(FromEligiblePlayers: possiblePlayers)
	let startingPlayers = pickStartingPlayers(FromPlayers: listedPlayers)

	return startingPlayers
}

func describe(team: Team) {

	let players = startingLineup(team: team)
	for player in players {
		describe(player: player)
	}
}


//	Game-related functions

func isValidGame(BetweenTeam team1: Team, andTeam team2: Team) -> Bool {
	return true
}



//	main app

var inter = createTeam(named: "Inter")
var liverpool = createTeam(named: "Liverpool")

inter.players.count



//	sprinkle some cards :)
var somePlayer = inter.players[7]

inter.players[7].numberOfYellowCards = 1
inter.players[6].numberOfYellowCards = 3
inter.players[14].numberOfYellowCards = 2
inter.players[19].numberOfYellowCards = 3
inter.players[2].hasRedCard = true

let eligibleInterPlayers = findGameEligiblePlayers(team: inter)
eligibleInterPlayers.count


let interGamePlayers = pickGamePlayers(FromEligiblePlayers: eligibleInterPlayers)
interGamePlayers.count

let interStartingPlayers = pickStartingPlayers(FromPlayers: interGamePlayers)
interStartingPlayers.count

let interPlayers = startingLineup(team: inter)
let liverpoolPlayers = startingLineup(team: liverpool)


describe(team: inter)


