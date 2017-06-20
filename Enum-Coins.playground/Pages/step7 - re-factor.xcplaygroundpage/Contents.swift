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

//		var currentCoin = MoneyUSCoin.dollar
//		var count = amountLeft / currentCoin.rawValue
//		if count > 0 {
//			result.append( CoinPile(count, currentCoin) )
//			amountLeft %= count * currentCoin.rawValue
//		}

		//	ako sada pogledamo ovaj kod, izgleda potpuno identično za svaki od novčića a jedina izmena je vrsta novčića
		//	kada imate više sukcesivnih linija koda onda je to odmah znak da to treba izvući u zasebnu funkciju
		//	a promenljive koje se menjaju onda postaju argumenti funkcije (currentCoin)

		//	ok, ali šta ćemo sa amountLeft, koji treba da se menja sa svakim pozivom te funkcije i da ta izmenjena vrednost bude ulaz za naredni poziv -> inout parametar

		//	obzirom da se može desiti da novčića bude 0, to znači da ni ne treba tu vrstu novčića uopšte spomenuti u rezultatu -> Optional

		func number(OfCoins coin: MoneyUSCoin, fromAmount amount: inout Int) -> CoinPile? {
			let count = amount / coin.rawValue
			if count > 0 {
				amount %= count * coin.rawValue
				return CoinPile(count, coin)
			}
			return nil
		}

		//	sada implementiramo ovu funkciju
		if let pile = number(OfCoins: .dollar, fromAmount: &amountLeft) {
			result.append( pile )
		}

		if let pile = number(OfCoins: .quarter, fromAmount: &amountLeft) {
			result.append( pile )
		}

		if let pile = number(OfCoins: .dime, fromAmount: &amountLeft) {
			result.append( pile )
		}

		if let pile = number(OfCoins: .nickel, fromAmount: &amountLeft) {
			result.append( pile )
		}

		if let pile = number(OfCoins: .penny, fromAmount: &amountLeft) {
			result.append( pile )
		}

		return result
	}
}

var coins = MoneyUSCoin.howMany(forAmountInDollars: 3.48)
var coins2 = MoneyUSCoin.howMany(forAmountInDollars: 4.01)
var coins3 = MoneyUSCoin.howMany(forAmountInDollars: 1.41)	//	one of each :)

//: [Next](@next)
