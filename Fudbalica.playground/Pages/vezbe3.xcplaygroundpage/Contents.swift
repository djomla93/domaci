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

typealias Team = (
	name: String,
	players: [Player]
)





//: [Next](@next)
