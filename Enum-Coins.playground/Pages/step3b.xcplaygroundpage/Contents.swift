//: [Previous](@previous)

import Foundation

enum MoneyUSCoin : Int {
	case penny		= 1
	case nickel		= 5
	case dime		= 10
	case quarter	= 25
	case dollar		= 100
}

//	funkcija treba da vrati niz tuple-ova. stoga prvo definiši tuple

typealias CoinPile = (count: Int, coin: MoneyUSCoin)

//	sada tek ide funkcija

func howManyCoins(forAmountInDollars amount: Double) -> [CoinPile] {

	//	treba vratiti niz, stoga ga inicijalizujemo na prazan
	var result : [CoinPile] = []


	return result
}

var coins = howManyCoins(forAmountInDollars: 3.48)
var coins2 = howManyCoins(forAmountInDollars: 4.01)
var coins3 = howManyCoins(forAmountInDollars: 1.41)	//	one of each :)



//: [Next](@next)
