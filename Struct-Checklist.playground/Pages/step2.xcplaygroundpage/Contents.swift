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
}

extension TaskItem {

	init(text: String) {
		self.text = text
		self.displayOrder = 0
	}

	init(text: String, withPriority priority: TaskPriority) {
		self.text = text
		self.displayOrder = 0
		self.priority = priority
	}

	init(text: String, withOrder order: Int, andPriority priority: TaskPriority) {
		self.text = text
		self.displayOrder = order
		self.priority = priority
	}

	init(text: String, due dueDate: TaskDueDate) {
		self.text = text
		self.displayOrder = 0
		self.dueDate = dueDate
	}
}

var firstTask = TaskItem(text: "Do homework")
var secondTask = TaskItem(text: "Do homework", withPriority: .high)
var thirdTask = TaskItem(text: "Do homework", due: .tomorrow)


//: [Next](@next)
