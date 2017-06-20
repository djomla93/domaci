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


//	(7)
extension Activity {

	//	few elaborate examples...

	init(atWorkWithTitle title: String) {
		self.title = title
		self.location = .work
	}

	init(atHomeWithTitle title: String) {
		self.title = title
		self.location = .home
	}

	init(atSchoolWithTitle title: String) {
		self.title = title
		self.location = .school
	}

	//	but this is more in Swift3 spirit

	init(at location: ActivityLocation, titled title: String) {
		self.title = title
		self.location = location
	}
}




//	TESTING

var workItem1 = TaskItem(text: "Timesheet", due: .tomorrow)
var workItem2 = TaskItem(text: "Estimates for current project", due: .thisWeek)

var firstActivity = Activity(title: "Weekly Report")
firstActivity.add(task: workItem1)
firstActivity.add(task: workItem2)

firstActivity.tasksDueToday().count
var workItem3 = TaskItem(text: "Gifts", due: .today)
firstActivity.add(task: workItem3)
firstActivity.tasksDueToday().count

//	(7)
//	not bad
var workActivity = Activity(atWorkWithTitle: "Work stuff")
var homeActivity = Activity(atHomeWithTitle: "Renovation")
//	but this is better
var schoolActivity = Activity(at: .school, titled: "Homework")



//: [Next](@next)
