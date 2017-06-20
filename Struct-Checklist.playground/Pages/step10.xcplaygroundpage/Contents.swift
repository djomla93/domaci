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

extension Activity {

	func tasksDueToday() -> [TaskItem] {
		var result = [TaskItem]()
		for task in self.tasks {
			if let dueDate = task.dueDate {
				if (dueDate == .today) {
					result.append(task)
				}
			}
		}
		return result
	}
}

extension Activity {

	init(at location: ActivityLocation, titled title: String) {
		self.title = title
		self.location = location
	}
}

extension Activity {

	func uncompletedTasks() -> [TaskItem] {
		var result = [TaskItem]()
		for task in self.tasks {
			if !task.completed {
				result.append(task)
			}
		}
		return result
	}
}


//	TESTING

var firstActivity = Activity(title: "Weekly Report")
var schoolActivity = Activity(at: .school, titled: "Homework")

var allActivities = [firstActivity, schoolActivity]

//	(10)
func unfinishedActivities() -> [Activity] {
	var result = [Activity]()

	for activity in allActivities {
		if activity.uncompletedTasks().count > 0 {
			result.append(activity)
		}
	}

	return result
}

unfinishedActivities().count


//: [Next](@next)
