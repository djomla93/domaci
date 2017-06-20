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
}

struct Company {
	var name: String
	var industryType: String
	var homePage: String
}


//: [Next](@next)
