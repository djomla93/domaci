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

//	pretvorimo funkciju u method
//	i to static method, jer ova funkcija ne barata sa pojedinačnom case vrednošću

extension MoneyUSCoin {

	static func howMany(forAmountInDollars amount: Double) -> [CoinPile] {

		//	treba vratiti niz, stoga ga inicijalizujemo na prazan
		var result : [CoinPile] = []

		//	idemo redom i skidamo deo po deo sume
		//	obzirom da nam je model definisan sa Int-om, onda pomnožimo sa 100 da radimo sa celim brojevima
		var amountLeft = Int(amount * 100.0)

		//	počinjemo od najvećih kovanica
		let dollars = amountLeft / MoneyUSCoin.dollar.rawValue
		if dollars > 0 {
			result.append( CoinPile(dollars, MoneyUSCoin.dollar) )
			amountLeft %= dollars * MoneyUSCoin.dollar.rawValue
		}

		let quarters = amountLeft / MoneyUSCoin.quarter.rawValue
		if quarters > 0 {
			result.append( CoinPile(quarters, MoneyUSCoin.quarter) )
			amountLeft %= quarters * MoneyUSCoin.quarter.rawValue
		}

		let dimes = amountLeft / MoneyUSCoin.dime.rawValue
		if dimes > 0 {
			result.append( CoinPile(dimes, MoneyUSCoin.dime) )
			amountLeft %= dimes * MoneyUSCoin.dime.rawValue
		}

		let nickels = amountLeft / MoneyUSCoin.nickel.rawValue
		if nickels > 0 {
			result.append( CoinPile(nickels, MoneyUSCoin.nickel) )
			amountLeft %= nickels * MoneyUSCoin.nickel.rawValue
		}

		let pennies = amountLeft / MoneyUSCoin.penny.rawValue
		if pennies > 0 {
			result.append( CoinPile(pennies, MoneyUSCoin.penny) )
			amountLeft %= pennies * MoneyUSCoin.penny.rawValue
		}
		
		return result
	}
}

var coins = MoneyUSCoin.howMany(forAmountInDollars: 3.48)
var coins2 = MoneyUSCoin.howMany(forAmountInDollars: 4.01)
var coins3 = MoneyUSCoin.howMany(forAmountInDollars: 1.41)	//	one of each :)


//: [Next](@next)
