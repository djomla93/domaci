//: [Previous](@previous)

import Foundation

enum TaskPriority {
	case low, def, high, urgent
}

enum TaskDueDate {
	case today
	case tomorrow
	case thisWeek
	case thisMonth
	case anytime
}

struct TaskItem {
	var text : String
	var displayOrder: Int
	var completed: Bool = false

	var priority: TaskPriority = .def
	var dueDate: TaskDueDate?

	//	sprečiti dodavanje tagova đuture, 
	//	kada bi moglo da se setuje više od 5 odjednom
	private(set) var tags = [String]()

	//	funkcija koja dodaje tag i brine se o tome da ih nema više od 5
	mutating func addTag(tag: String) {
		if self.tags.count >= 5 {
			print("You can't have more than 5 tags per item")
			return
		}
		self.tags.append(tag)
	}
}


//: [Next](@next)
