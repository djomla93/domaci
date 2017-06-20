//: [Previous](@previous)

import Foundation

//	# # Car Dealership # #
//	4. Napisati 4 nasleđene klase od ove osnovne, za svaki od tipova vozila. 
//	U svakoj od novih klasa dodati parametar koji opisuje broj točkova

enum VehicleType {
	case motorBike, car, truck, bus
}

enum VehicleMaker {
	case Ducati, Honda, Yamaha
	case Renault, VW, Mercedes, Tesla, BMW
	case Iveco
	case Ferrari, Maserati
}


class Vehicle {
	let type: VehicleType

	init(type: VehicleType) {
		self.type = type
	}

	class var makers: [VehicleMaker] {
		return [
			.Ducati,
			.Honda,
			.Yamaha,
			.Renault,
			.VW,
			.Mercedes,
			.Tesla,
			.BMW,
			.Iveco,
			.Ferrari,
			.Maserati
		]
	}
}


//	(4)
class MotorBike: Vehicle {

	var numberOfWheels = 2

	init() {
		super.init(type: .motorBike)
	}

}

class Bus: Vehicle {

	var numberOfWheels = 6

	init() {
		super.init(type: .bus)
	}

}

class Truck: Vehicle {

	var numberOfWheels = 8

	init() {
		super.init(type: .truck)
	}

}

class Car: Vehicle {

	var numberOfWheels = 4

	init() {
		super.init(type: .car)
	}

}


//: [Next](@next)
