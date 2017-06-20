//: [Previous](@previous)

import Foundation

enum SocialNetwork {
	case facebook, twitter, instagram
}

struct SocialNetworkAccount {
	var username: String
	let network: SocialNetwork
}

struct Contact {
	var firstName: String
	var lastName: String
	var email: String
	var socialNetworkAccounts : [SocialNetworkAccount] = []

	var company: Company?

	init() {
		firstName = ""
		lastName = ""
		email = ""
	}
}

struct Company {
	var name: String
	var industryType: String
	var homePage: String

	var employees: [Contact] = []

//	var person = Contact()
//	var person = Contact(firstName: "", lastName: "", email: "", socialNetworkAccounts: [], company: nil)

	init() {
		name = ""
		industryType = ""
		homePage = ""
	}
}

var firma = Company()
firma.employees.count


var p1 = Contact()
p1.company = firma
firma.employees.append(p1)

p1.company?.employees.count



//: [Next](@next)
