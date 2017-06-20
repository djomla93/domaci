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

		//	ok, ali šta ćemo sa amountLeft, koji treba da se menja sa svakim pozivom te funkcije i da ta izmenjena vrednost bude ulaz za naredni poziv
		//	U ovom primeru direktno zovemo amountLeft.
		//	Ovde je to prihvatljivo raditi jer amountLeft nije u globalnom scopeu, već unutar funkcije
		//	Van `howMany(forAmountInDollars:)` funkcije amountLeft ni ne postoji i nećemo uticati na globalni rad programa

		//	Stoga je ok da ovde koristimo amountLeft bez da smo je preneli kao argument
		//	(slično kao za properties unutar struct, class)
		func number(OfCoins coin: MoneyUSCoin) -> CoinPile? {
			let count = amountLeft / coin.rawValue
			if count > 0 {
				amountLeft %= count * coin.rawValue
				return CoinPile(count, coin)
			}
			return nil
		}

		//	sada implementiramo ovu funkciju
		if let pile = number(OfCoins: .dollar) {
			result.append( pile )
		}

		if let pile = number(OfCoins: .quarter) {
			result.append( pile )
		}

		if let pile = number(OfCoins: .dime) {
			result.append( pile )
		}

		if let pile = number(OfCoins: .nickel) {
			result.append( pile )
		}

		if let pile = number(OfCoins: .penny) {
			result.append( pile )
		}

		return result
	}
}

var coins = MoneyUSCoin.howMany(forAmountInDollars: 3.48)
var coins2 = MoneyUSCoin.howMany(forAmountInDollars: 4.01)
var coins3 = MoneyUSCoin.howMany(forAmountInDollars: 1.41)	//	one of each :)

//: [Next](@next)
