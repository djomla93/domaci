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

extension MoneyUSCoin {

	static func howMany(forAmountInDollars amount: Double) -> [CoinPile] {

		//	treba vratiti niz, stoga ga inicijalizujemo na prazan
		var result : [CoinPile] = []

		var amountLeft = Int(amount * 100.0)

		//	u originalnom kodu iz step4 po 3x ponavljamo svaki od mogućih novčića
		//	to je znak da tu vrednost treba izvući u promenljivu (currentCoin)

		var currentCoin = MoneyUSCoin.dollar
		let dollars = amountLeft / currentCoin.rawValue
		if dollars > 0 {
			result.append( CoinPile(dollars, currentCoin) )
			amountLeft %= dollars * currentCoin.rawValue
		}

		currentCoin = MoneyUSCoin.quarter
		let quarters = amountLeft / currentCoin.rawValue
		if quarters > 0 {
			result.append( CoinPile(quarters, currentCoin) )
			amountLeft %= quarters * currentCoin.rawValue
		}

		currentCoin = MoneyUSCoin.dime
		let dimes = amountLeft / currentCoin.rawValue
		if dimes > 0 {
			result.append( CoinPile(dimes, currentCoin) )
			amountLeft %= dimes * currentCoin.rawValue
		}

		currentCoin = MoneyUSCoin.nickel
		let nickels = amountLeft / currentCoin.rawValue
		if nickels > 0 {
			result.append( CoinPile(nickels, currentCoin) )
			amountLeft %= nickels * currentCoin.rawValue
		}

		currentCoin = MoneyUSCoin.penny
		let pennies = amountLeft / currentCoin.rawValue
		if pennies > 0 {
			result.append( CoinPile(pennies, currentCoin) )
			amountLeft %= pennies * currentCoin.rawValue
		}

		return result
	}
}

var coins = MoneyUSCoin.howMany(forAmountInDollars: 3.48)
var coins2 = MoneyUSCoin.howMany(forAmountInDollars: 4.01)
var coins3 = MoneyUSCoin.howMany(forAmountInDollars: 1.41)	//	one of each :)


//: [Next](@next)
