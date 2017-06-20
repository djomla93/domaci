//: [Previous](@previous)

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


//	(2)
class Pupil: Person {

}

class Employee: Person {

}

class Teacher: Employee {

}

class Guard: Employee {

}

class Cleaner: Employee {

}

class Headmaster: Teacher {

}



//	(3)
class PupilClass {
	var teacher: Teacher?
	var pupils = [Pupil]()
	var mark: String

	init(mark: String) {
		self.mark = mark
	}

	//	(4)
	weak var generation: PupilGeneration!
}


//	(4)
class PupilGeneration {
	var classes = [PupilClass]()
}

//: [Next](@next)
