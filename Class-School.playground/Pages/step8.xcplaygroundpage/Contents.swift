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

	//	(6)
	weak var pupilClass: PupilClass? {
		//	(8)
		didSet {
			pupilClass?.pupils.append(self)
		}
	}
}

class Employee: Person {

}

class Teacher: Employee {

	//	(5)
	weak var pupilClass: PupilClass?
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

	//	(7)
	weak var school: School? {
		didSet {
			school?.generations.append(self)
		}
	}
}


//	(7)
class School {
	var name: String

	var employees = [Employee]()
	var teachers = [Teacher]()
	var pupils = [Pupil]()
	var headmaster: Headmaster!

	var generations = [PupilGeneration]()

	init(name: String) {
		self.name = name
	}
}

var school = School(name: "Ćirilo i Metodije")
var teacher = Teacher(firstName: "Jovana", lastName: "Jovanović", age: 24, gender: .male)
var classI1 = PupilClass(mark: "III-5")

//	(8)
extension School {

	func enlistPupil(pupil: Pupil, intoClass pupilClass: PupilClass) {
		//	assign to list of all pupils in school
		self.pupils.append(pupil)

		//	assign the class (odeljenje) to the pupil
		//	property observer here will take care of assiging the other end of relationship
		pupil.pupilClass = pupilClass
	}
}

//: [Next](@next)
