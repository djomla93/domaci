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
	var teacher: Teacher? {
		//	(9)
		didSet {
			teacher?.pupilClass = self
		}
	}
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


extension School {

	//	(9)
	func assignTeacher(_ teacher: Teacher, toClass pupilClass: PupilClass) {
		pupilClass.teacher = teacher
	}
}



//	(10)
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




//	(15)	TESTING
let school = School(name: "Ćirilo i Metodije")

let classGenIII = PupilGeneration()
classGenIII.school = school

let classIII5 = PupilClass(mark: "III-5")
classIII5.generation = classGenIII

let teacher = Teacher(firstName: "Jovana", lastName: "Jovanović", age: 24, gender: .male)
school.assignTeacher(teacher, toClass: classIII5)

let myKid = Pupil(firstName: "Aleksa", lastName: "Vacić", age: 9, gender: .male)
school.enlistPupil(pupil: myKid, intoClass: classIII5)


school.pupils.count
teacher.pupilClass?.mark
teacher.totalStudents


//: [Next](@next)
