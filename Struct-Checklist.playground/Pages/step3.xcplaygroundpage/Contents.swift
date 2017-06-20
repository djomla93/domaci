//: [Previous](@previous)

import Foundation

//	just a dummy skeleton, for syntax reasons
struct TaskItem {
}


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

var firstActivity = Activity(title: "Weekly Report")

//: [Next](@next)
