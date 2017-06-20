//: Playground - noun: a place where people can play

import Foundation


//	(1)
enum Gender {
	case male, female, other
}

class Person {
	var firstName: String
	var lastName: String
	var age: Int
	var gender: Gender

	init(firstName: String, lastName: String, age: Int, gender: Gender) {
		self.firstName = firstName
		self.lastName = lastName
		self.age = age
		self.gender = gender
	}
}

var myKid = Person(firstName: "Aleksa", lastName: "Vacić", age: 9, gender: .male)


