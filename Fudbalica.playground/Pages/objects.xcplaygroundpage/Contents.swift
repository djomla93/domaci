//: [Previous](@previous)

import Foundation

//	Data Model

enum PlayPosition: Int {
	case keeper = 0
	case defender
	case midfielder
	case forward
}


struct Player {
	var name: String
	var shirtNumber: Int
	var position: PlayPosition
	var numberOfYellowCards: Int = 0
	var hasRedCard: Bool = false

	init(name: String, shirtNumber: Int, position: PlayPosition) {
		self.name = name
		self.shirtNumber = shirtNumber
		self.position = position
	}

}

var player = Player(name: "Brat Pantela",
                    shirtNumber: 10,
                    position: .forward)
player.numberOfYellowCards = 1




class Team {
	var name : String
	var players : [Player] = []

	init(name: String) {
		self.name = name
	}
}

var team = Team(name: "Srbija")




//	create/populate teams
func createTeam(named name: String) -> Team {

	let team = Team(name: name)

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
			shirtNumber: shirtNum,
			position: poz
		)
		team.players.append(p)

		shirtNum += 1
	} while (shirtNum <= 22)

	return team
}








//	primer za extension


extension Player {
	func described() -> String {

		let redCardDesc = self.hasRedCard ? ". Has red card!" : ""
		let yellowCards = self.numberOfYellowCards == 0 ? "" : ". Has \(self.numberOfYellowCards) yellow cards"

		return "Player \(self.name), #\(self.shirtNumber), position: \(self.position)\(redCardDesc)\(yellowCards)"
	}

	var description : String {
		get {
			let redCardDesc = self.hasRedCard ? ". Has red card!" : ""
			let yellowCards = self.numberOfYellowCards == 0 ? "" : ". Has \(self.numberOfYellowCards) yellow cards"

			return "Player \(self.name), #\(self.shirtNumber), position: \(self.position)\(redCardDesc)\(yellowCards)"
		}
	}
}




//	method
print( player.described() )
//	computed property
print( player.description )












extension Player {

	var isGoalKeeper : Bool {
		return (self.position == .keeper)
	}

	var isGameEligible : Bool {
		if self.hasRedCard {
			return false
		}

		if (self.numberOfYellowCards == 3) {
			return false
		}

		return true
	}
}





extension Team {

	//	"vrati" sve igrače koji mogu biti prijavljeni za utakmicu
	//	func findGameEligiblePlayers(team: Team) -> [Player]
	var availablePlayers : [Player] {
		var p = [Player]()

		for player in self.players {
			if !player.isGameEligible { continue }
			p.append(player)
		}

		return p
	}


	//	izaberi tim za prijavu utakmice. min 2 golmana i 14 drugih igrača
	//	func pickGamePlayers(FromEligiblePlayers allPlayers: [Player]) -> [Player]
	var gamePlayers : [Player] {

		var p = [Player]()
		var goalkeepersCount = 0
		var othersCount = 0

		for player in self.availablePlayers {

			if player.isGoalKeeper {
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

	//	list of starting Players
	//	func pickStartingPlayers(FromPlayers allPlayers: [Player]) -> [Player] {
	var startingPlayers : [Player] {

		var p = [Player]()
		var goalkeepersCount = 0
		var othersCount = 0

		for player in self.gamePlayers {

			if player.isGoalKeeper {
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

	var description: String {
		var desc = ""
		for player in self.startingPlayers {
			desc += player.description + "\n"
		}

		return desc
	}
}





//	main app

var inter = createTeam(named: "Inter")
var liverpool = createTeam(named: "Liverpool")

print( inter.description )


//	sprinkle some cards :)
inter.players[7].numberOfYellowCards = 1
inter.players[6].numberOfYellowCards = 3
inter.players[14].numberOfYellowCards = 2
inter.players[19].numberOfYellowCards = 3
inter.players[2].hasRedCard = true


let interPlayers = inter.startingPlayers
let liverpoolPlayers = liverpool.startingPlayers








//: [Next](@next)
