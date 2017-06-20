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
	var availablePlayers : [Player] {

		return self.players.flatMap({ ($0.isGameEligible) ? $0 : nil })
	}


	//	izaberi tim za prijavu utakmice. min 2 golmana i 14 drugih igrača
	var gamePlayers : [Player] {

		//	2 vrste igrača jurimo, golmani(goalkeepers) i ostali(others)
		typealias T = ( goalkeepers: [Player], others: [Player] )
		//	inicijalna vrednost je tuple praznih nizova
		let start: T = ([], [])

		let end = self.availablePlayers.reduce(start) { (acc, player) in
			//	ovaj closure se izvrši za svakog igrača
			//	ako je golman
			if player.isGoalKeeper {
				//	i ako nismo već dodali 2
				if acc.goalkeepers.count < 2 {
					//	onda dodaš tog jednog i vratiš novo stanje akumulatora
					return (acc.goalkeepers + [player], acc.others)
				}
			//	ako nije golman, onda ako nemamo još uvek 14
			} else if acc.others.count < 14 {
				//	dodajemo tog drugog
				return (acc.goalkeepers, acc.others + [player])
			}
			return acc
			//	svaki return mora da vrati isti tip podataka kao što je ulazni, tj. tuple T
		}

		return end.goalkeepers + end.others
	}

	//	list of starting Players
	var startingPlayers : [Player] {

		typealias T = ( goalkeepers: [Player], others: [Player] )
		let start: T = ([], [])

		let end = self.gamePlayers.reduce(start) { (acc, player) in
			if player.isGoalKeeper {
				if acc.goalkeepers.count < 1 {
					return (acc.goalkeepers + [player], acc.others)
				}
			} else if acc.others.count < 10 {
				return (acc.goalkeepers, acc.others + [player])
			}
			return acc
		}

		return end.goalkeepers + end.others
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
