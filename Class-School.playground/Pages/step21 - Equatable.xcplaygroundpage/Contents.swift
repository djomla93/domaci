//: [Previous](@previous)

import Foundation


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



class Pupil: Person {
	weak var pupilClass: PupilClass? {
		didSet {
			pupilClass?.pupils.append(self)
		}
	}
}

class Employee: Person {

}

class Teacher: Employee {
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
	var teacher: Teacher? {
		didSet {
			teacher?.pupilClass = self
		}
	}
	var pupils = [Pupil]()
	var mark: String

	init(mark: String) {
		self.mark = mark
	}

	weak var generation: PupilGeneration! {
		didSet {
			generation.classes.append(self)
		}
	}
}

class PupilGeneration {
	var classes = [PupilClass]()

	weak var school: School! {
		didSet {
			school.generations.append(self)
		}
	}

	init(school: School) {
		self.school = school
	}
}


class School {
	var name: String

	var employees = [Employee]()
	var headmaster: Headmaster!

	var generations = [PupilGeneration]()

	init(name: String) {
		self.name = name
	}
}



extension School {
	func enlistPupil(pupil: Pupil, intoClass pupilClass: PupilClass) {
		pupil.pupilClass = pupilClass
	}

	func assignTeacher(_ teacher: Teacher, toClass pupilClass: PupilClass) {
		pupilClass.teacher = teacher
	}
}



extension Teacher {
	var totalStudents: Int {
		get {
			if let pc = self.pupilClass {
				return pc.pupils.count
			}
			return 0
		}
	}
}



extension School {
	var teachers: [Teacher] {
		return generations.flatMap({
			$0.classes.flatMap({
				$0.teacher
			})
		})
	}

	var pupils: [Pupil] {
		return generations.flatMap({
			$0.classes.flatMap({
				$0.pupils
			})
		})
	}

	var classes: [PupilClass] {
		return generations.flatMap({
			$0.classes
		})
	}
}



//	(21)	- Equatable protocol
//			==	how to make sure that it's possible to compare two class instances
//				and thus use stuff like indexOf() or contains() when you make an array of these objects

//	first, adopt the protocol, where needed
extension PupilClass: Equatable {
	static func ==(lhs: PupilClass, rhs: PupilClass) -> Bool {
		//	this would be wrong to do:
		//	return lhs.mark == rhs.mark

		//	since these are Class instances, they are equal only if their pointers are equal
		//	In Swift, each class instance is assigned a unique identifier
		//	so we should use that
		return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
	}
	
}



//	do the same for other Classes, as needed
extension Person: Equatable {
	static func ==(lhs: Person, rhs: Person) -> Bool {
		return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
	}
}

extension PupilGeneration: Equatable {
	static func ==(lhs: PupilGeneration, rhs: PupilGeneration) -> Bool {
		return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
	}
}



//: [Next](@next)
