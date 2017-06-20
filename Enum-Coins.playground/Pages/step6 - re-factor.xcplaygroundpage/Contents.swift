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

		//	isti postupak možemo primeniti i na ove silne let dollars, let quarters itd
		//	kao što currentCoin menjamo za svaki novčić, možemo i sračunatu vrednost za količinu novčića

		var currentCoin = MoneyUSCoin.dollar
		var count = amountLeft / currentCoin.rawValue
		if count > 0 {
			result.append( CoinPile(count, currentCoin) )
			amountLeft %= count * currentCoin.rawValue
		}

		currentCoin = MoneyUSCoin.quarter
		count = amountLeft / currentCoin.rawValue
		if count > 0 {
			result.append( CoinPile(count, currentCoin) )
			amountLeft %= count * currentCoin.rawValue
		}

		currentCoin = MoneyUSCoin.dime
		count = amountLeft / currentCoin.rawValue
		if count > 0 {
			result.append( CoinPile(count, currentCoin) )
			amountLeft %= count * currentCoin.rawValue
		}

		currentCoin = MoneyUSCoin.nickel
		count = amountLeft / currentCoin.rawValue
		if count > 0 {
			result.append( CoinPile(count, currentCoin) )
			amountLeft %= count * currentCoin.rawValue
		}

		currentCoin = MoneyUSCoin.penny
		count = amountLeft / currentCoin.rawValue
		if count > 0 {
			result.append( CoinPile(count, currentCoin) )
			amountLeft %= count * currentCoin.rawValue
		}

		return result
	}
}

var coins = MoneyUSCoin.howMany(forAmountInDollars: 3.48)
var coins2 = MoneyUSCoin.howMany(forAmountInDollars: 4.01)
var coins3 = MoneyUSCoin.howMany(forAmountInDollars: 1.41)	//	one of each :)

//: [Next](@next)
