//: [Previous](@previous)

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
	weak var company: Company? {
		//	(6b)	//	auto-add to employees array at the company
		didSet {
			company?.employees.insert(self)
		}
	}
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

	//	(6b)
	var employees = Set<Contact>()
}

//	(6b)
extension Contact: Hashable {
	var hashValue: Int {
		return self.firstName.hashValue + self.lastName.hashValue + self.email.hashValue
	}

	//	(6b)
	static func ==(lhs: Contact, rhs: Contact) -> Bool {
		return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
	}
}



//	primeri

var nike = Company(name: "Nike", industry: "Sports", homePage: "www.nike.com")

var person = Contact(firstName: "Brat", lastName: "Pantela", email: "")
person.company?.name
nike.employees.count


//person.company = nike
//nike.employees.insert(person)



//: [Next](@next)
