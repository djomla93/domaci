//: Playground - noun: a place where people can play

//	# # Novčići # #

//	(1)
/*
enum MoneyUSCoin {
case Penny
case Nickel
case Dime
case Quarter
case Dollar
}
*/

//	(2)
enum MoneyUSCoin : Int {
	case Penny = 1
	case Nickel = 5
	case Dime = 10
	case Quarter = 25
	case Dollar = 100
}

typealias CoinPile = (count: Int, coin: MoneyUSCoin)

func howManyCoinsForAmount(InDollars amount: Double) -> [CoinPile] {

	var result : [CoinPile] = []

	var amountLeft = amount * 100.0

	let dollars = Int( amountLeft / Double(MoneyUSCoin.Dollar.rawValue) )
	if dollars > 0 {
		result.append( CoinPile(dollars, MoneyUSCoin.Dollar) )
		amountLeft %= Double( dollars * MoneyUSCoin.Dollar.rawValue )
	}

	let quarters = Int( amountLeft / Double(MoneyUSCoin.Quarter.rawValue) )
	if quarters > 0 {
		result.append( CoinPile(quarters, MoneyUSCoin.Quarter) )
		amountLeft %= Double( quarters * MoneyUSCoin.Quarter.rawValue )
	}

	let dimes = Int( amountLeft / Double(MoneyUSCoin.Dime.rawValue) )
	if dimes > 0 {
		result.append( CoinPile(dimes, MoneyUSCoin.Dime) )
		amountLeft %= Double( dimes * MoneyUSCoin.Dime.rawValue )
	}

	let nickels = Int( amountLeft / Double(MoneyUSCoin.Nickel.rawValue) )
	if nickels > 0 {
		result.append( CoinPile(nickels, MoneyUSCoin.Nickel) )
		amountLeft %= Double( nickels * MoneyUSCoin.Nickel.rawValue )
	}

	let pennies = Int( amountLeft / Double(MoneyUSCoin.Penny.rawValue) )
	if pennies > 0 {
		result.append( CoinPile(pennies, MoneyUSCoin.Penny) )
		amountLeft %= Double( pennies * MoneyUSCoin.Penny.rawValue )
	}

	return result
}

var coins = howManyCoinsForAmount(InDollars: 3.48)
var coins2 = howManyCoinsForAmount(InDollars: 4.01)
var coins3 = howManyCoinsForAmount(InDollars: 1.41)	//	one of each :)


//	# # END of assignment # #






//	Advanced developers would continue on to improve this function.
//	Here's one way to do it


//	Original function is too repetitive and too hard to read
//	(too many long repeated strings)
//	let's improve it, by re-factoring to code that's easier to read
func betterCoinsForAmount(InDollars amount: Double) -> [CoinPile] {

	var result : [CoinPile] = []

	var amountLeft = amount * 100.0

	var currentCoin = MoneyUSCoin.Dollar
	let dollars = Int( amountLeft / Double(currentCoin.rawValue) )
	if dollars > 0 {
		result.append( CoinPile(dollars, currentCoin) )
		amountLeft %= Double( dollars * currentCoin.rawValue )
	}

	currentCoin = MoneyUSCoin.Quarter
	let quarters = Int( amountLeft / Double(currentCoin.rawValue) )
	if quarters > 0 {
		result.append( CoinPile(quarters, currentCoin) )
		amountLeft %= Double( quarters * currentCoin.rawValue )
	}

	currentCoin = MoneyUSCoin.Dime
	let dimes = Int( amountLeft / Double(currentCoin.rawValue) )
	if dimes > 0 {
		result.append( CoinPile(dimes, currentCoin) )
		amountLeft %= Double( dimes * currentCoin.rawValue )
	}

	currentCoin = MoneyUSCoin.Nickel
	let nickels = Int( amountLeft / Double(currentCoin.rawValue) )
	if nickels > 0 {
		result.append( CoinPile(nickels, currentCoin) )
		amountLeft %= Double( nickels * currentCoin.rawValue )
	}

	currentCoin = MoneyUSCoin.Penny
	let pennies = Int( amountLeft / Double(currentCoin.rawValue) )
	if pennies > 0 {
		result.append( CoinPile(pennies, currentCoin) )
		amountLeft %= Double( pennies * currentCoin.rawValue )
	}

	return result
}

//	always test that it works after re-factoring
betterCoinsForAmount(InDollars: 3.48)
betterCoinsForAmount(InDollars: 4.01)
betterCoinsForAmount(InDollars: 1.41)	//	one of each :)


//	ok, but this is still too much to type and easy to make mistakes
//	it sort of nudges you to use copy/paste and is very easy to make mistakes there
//	let's rename stuff to be easy to copy paste
func bitMoreBetterCoinsForAmount(InDollars amount: Double) -> [CoinPile] {

	var result : [CoinPile] = []

	var amountLeft = amount * 100.0

	var currentCoin = MoneyUSCoin.Dollar
	var count = Int( amountLeft / Double(currentCoin.rawValue) )
	if count > 0 {
		result.append( CoinPile(count, currentCoin) )
		amountLeft %= Double( count * currentCoin.rawValue )
	}

	currentCoin = MoneyUSCoin.Quarter
	count = Int( amountLeft / Double(currentCoin.rawValue) )
	if count > 0 {
		result.append( CoinPile(count, currentCoin) )
		amountLeft %= Double( count * currentCoin.rawValue )
	}

	currentCoin = MoneyUSCoin.Dime
	count = Int( amountLeft / Double(currentCoin.rawValue) )
	if count > 0 {
		result.append( CoinPile(count, currentCoin) )
		amountLeft %= Double( count * currentCoin.rawValue )
	}

	currentCoin = MoneyUSCoin.Nickel
	count = Int( amountLeft / Double(currentCoin.rawValue) )
	if count > 0 {
		result.append( CoinPile(count, currentCoin) )
		amountLeft %= Double( count * currentCoin.rawValue )
	}

	currentCoin = MoneyUSCoin.Penny
	count = Int( amountLeft / Double(currentCoin.rawValue) )
	if count > 0 {
		result.append( CoinPile(count, currentCoin) )
		amountLeft %= Double( count * currentCoin.rawValue )
	}

	return result
}

//	always test that it works after re-factoring
bitMoreBetterCoinsForAmount(InDollars: 3.48)
bitMoreBetterCoinsForAmount(InDollars: 4.01)
bitMoreBetterCoinsForAmount(InDollars: 1.41)	//	one of each :)


//	weeeell, now it looks like a bunch of identical code
//	repeated many, many times
//	this is immediate hint that you can extract that repeated code into another function
func bestCoinsForAmount(InDollars amount: Double) -> [CoinPile] {

	var result : [CoinPile] = []

	var amountLeft = amount * 100.0

	func howMuchCoins(coin: MoneyUSCoin) -> CoinPile? {
		let count = Int( amountLeft / Double(coin.rawValue) )
		if count > 0 {
			amountLeft %= Double( count * coin.rawValue )
			return CoinPile(count, coin)
		}
		return nil
	}

	if let pile = howMuchCoins(MoneyUSCoin.Dollar) {
		result.append( pile )
	}
	if let pile = howMuchCoins(MoneyUSCoin.Quarter) {
		result.append( pile )
	}
	if let pile = howMuchCoins(MoneyUSCoin.Dime) {
		result.append( pile )
	}
	if let pile = howMuchCoins(MoneyUSCoin.Nickel) {
		result.append( pile )
	}
	if let pile = howMuchCoins(MoneyUSCoin.Penny) {
		result.append( pile )
	}

	return result
}

//	always test that it works after re-factoring
bestCoinsForAmount(InDollars: 3.48)
bestCoinsForAmount(InDollars: 4.01)
bestCoinsForAmount(InDollars: 1.41)	//	one of each :)
bestCoinsForAmount(InDollars: 0)
bestCoinsForAmount(InDollars: 0.6)
bestCoinsForAmount(InDollars: 0.14)




//	another way to possibly solve this with even less lines of code
func swiftCoinsForAmount(InDollars amount: Double) -> [CoinPile] {

	var result : [CoinPile] = []

	var amountLeft = amount * 100.0

	func hasNoMoneyLeftAfterExtractingCoins(coin: MoneyUSCoin) -> Bool {
		let count = Int( amountLeft / Double(coin.rawValue) )
		if count > 0 {
			result.append( (count, coin) )
			amountLeft %= Double( count * coin.rawValue )
		}
		return amountLeft == 0
	}

	let allCoins : [MoneyUSCoin] = [.Dollar, .Quarter, .Dime, .Nickel, .Penny]
	for currentCoin in allCoins {
		if hasNoMoneyLeftAfterExtractingCoins(currentCoin) {
			break
		}
	}

	return result
}

//	always test that it works after re-factoring
swiftCoinsForAmount(InDollars: 3.48)
swiftCoinsForAmount(InDollars: 4.01)
swiftCoinsForAmount(InDollars: 1.41)	//	one of each :)
swiftCoinsForAmount(InDollars: 0)
swiftCoinsForAmount(InDollars: 0.6)
swiftCoinsForAmount(InDollars: 0.14)


