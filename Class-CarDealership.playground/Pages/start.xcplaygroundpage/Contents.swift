//: Playground - noun: a place where people can play

import Foundation

//	# # Car Dealership # #
//1. Kreirati model vozila, sa sledećim parametrima: tip vozila (motor, automobil, kamion, autobus)


//	(1)
enum VehicleType {
	case motorBike, car, truck, bus
}

class Vehicle {
	var type: VehicleType

	init(type: VehicleType) {
		self.type = type
	}
}

