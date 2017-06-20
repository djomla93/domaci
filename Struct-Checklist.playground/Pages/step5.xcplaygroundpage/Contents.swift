//: [Previous](@previous)

import Foundation


//	TASK

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


//	ACTIVITY

enum ActivityLocation {
	case home, work, coffeeShop, groceryShop, school
}

struct Activity {
	var title: String
	var tasks = [TaskItem]()
	var location: ActivityLocation?

	init(title: String) {
		self.title = title
	}
}

extension Activity {

	mutating func add(task: TaskItem) {
		self.tasks.append(task)
	}
}


//	TESTING

var workItem1 = TaskItem(text: "Timesheet", due: .tomorrow)
var workItem2 = TaskItem(text: "Estimates for current project", due: .thisWeek)

var firstActivity = Activity(title: "Weekly Report")
firstActivity.add(task: workItem1)
firstActivity.add(task: workItem2)


//: [Next](@next)
