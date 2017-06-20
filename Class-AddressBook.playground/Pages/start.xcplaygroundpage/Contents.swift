//: Playground - noun: a place where people can play

import Foundation

enum SocialNetwork {
	case facebook, twitter, instagram
}

struct SocialNetworkAccount {
	var username: String
	let network: SocialNetwork
}

class Contact {
	var firstName: String
	var lastName: String
	var email: String
	var socialNetworkAccounts : [SocialNetworkAccount] = []

	init(firstName: String, lastName: String, email: String) {
		self.firstName = firstName
		self.lastName = lastName
		self.email = email
	}

	//	(4)
	weak var company: Company?
}

class Company {
	var name: String
	var industryType: String
	var homePage: String

	init(name: String, industry: String, homePage: String) {
		self.name = name
		self.industryType = industry
		self.homePage = homePage
	}

	//	(6)
	var employees = [Contact]()
}


//	primeri

var nike = Company(name: "Nike", industry: "Sports", homePage: "www.nike.com")

