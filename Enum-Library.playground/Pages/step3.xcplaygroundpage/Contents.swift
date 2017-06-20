//: [Previous](@previous)

import Foundation

//	data model
enum BookStatus {
	case rented(person: Person, date: Date)
	case available
}

typealias Person = (name: String, address: String)


//	test data
let me = Person(name: "Alek", address: "NBgd")
let bookStatus = BookStatus.rented(
	person: me,
	date: Date(timeIntervalSinceNow: -60*60*24*7)
)

//	processing data

switch bookStatus {
case .available:
	print("Book is available")
case .rented(let person, let date):
	print("Book is rented by \(person) since \(date)")
}


//: [Next](@next)
