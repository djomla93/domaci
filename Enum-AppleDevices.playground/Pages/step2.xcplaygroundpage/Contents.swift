//: [Previous](@previous)

import Foundation

enum ProductFamily {
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
	indirect case iPad(product: ProductFamily)

	case macmini
	case macBook
	case macBookPro
	case iMac
	case macPro
	indirect case mac(product: ProductFamily)
}

var myMacBookPro = ProductFamily.mac(product: .macBookPro)

switch myMacBookPro {
case .mac(let subFamily):
	print("My Mac belongs to \(subFamily) family")
default:
	print("Something else...")
}

//: [Next](@next)
