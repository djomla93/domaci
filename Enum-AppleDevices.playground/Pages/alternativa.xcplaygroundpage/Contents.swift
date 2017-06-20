//: [Previous](@previous)

import Foundation


//	using nested enums:

enum ProductFamily2 {
	enum iPad {
		case iPad1stGen
		case iPad2
		case iPad3
		case iPad4thGen
		case iPadMini
		case iPadmini2
		case iPadmini4
		case iPadAir
		case iPadAir2
		case iPadPro
		case iPadPro13
	}

	enum Mac {
		case Macmini
		case MacBook
		case MacBookPro
		case iMac
		case MacPro
	}
}

var myMacBookPro2 = ProductFamily2.Mac.MacBookPro


//: [Next](@next)
