//: [Previous](@previous)

import Foundation

//	# # Car Dealership # #
//	3. Dodati u model iz tačke 1, listu proizvođača vozila ali tako da tu listu nije moguće promeniti spolja (izvan klase), već se samo može pročitati


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

	//	(3)
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


//: [Next](@next)
