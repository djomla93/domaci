//: [Previous](@previous)

import Foundation

enum MoneyUSCoin : Int {
	case penny		= 1
	case nickel		= 5
	case dime		= 10
	case quarter	= 25
	case dollar		= 100

	//	re-factor nested function to be an instance method
	func count(inAmount amountLeft: inout Int) -> CoinPile? {
		let count = amountLeft / self.rawValue
		if count > 0 {
			amountLeft %= count * self.rawValue
			return CoinPile(count, self)
		}
		return nil
	}
}

//	funkcija treba da vrati niz tuple-ova. stoga prvo definiši tuple

typealias CoinPile = (count: Int, coin: MoneyUSCoin)

//	sada tek ide funkcija

extension MoneyUSCoin {

	static func howMany(forAmountInDollars amount: Double) -> [CoinPile] {

		//	treba vratiti niz, stoga ga inicijalizujemo na prazan
		var result : [CoinPile] = []

		var amountLeft = Int(amount * 100.0)

		//	obratite pažnu na self = sam tip, ne konkretna instanca

		if let pile = self.dollar.count(inAmount: &amountLeft) {
			result.append( pile )
		}

		if let pile = self.quarter.count(inAmount: &amountLeft) {
			result.append( pile )
		}

		if let pile = self.dime.count(inAmount: &amountLeft) {
			result.append( pile )
		}

		if let pile = self.nickel.count(inAmount: &amountLeft) {
			result.append( pile )
		}

		if let pile = self.penny.count(inAmount: &amountLeft) {
			result.append( pile )
		}

		return result
	}
}

var coins = MoneyUSCoin.howMany(forAmountInDollars: 3.48)
var coins2 = MoneyUSCoin.howMany(forAmountInDollars: 4.01)
var coins3 = MoneyUSCoin.howMany(forAmountInDollars: 1.41)	//	one of each :)

//: [Next](@next)
