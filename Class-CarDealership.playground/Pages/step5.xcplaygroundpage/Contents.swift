//: [Previous](@previous)

import Foundation

//	# # Car Dealership # #
/*	5. Suziti listu mogućih proizvođača u svakoj od 4 nove klase, tako da se vraćaju samo oni proizvođači koji prave proizvode tog tipa
- Ducati (motor)
- Honda (motor, auto)
- Yamaha (motor)
- Renault (auto, kamion),
- VW (auto, kamion)
- Mercedes (auto, kamion, bus)
- Tesla (auto)
- BMW (motor, auto)
- Iveco (kamion)
- Ferrari (auto)
- Maserati (auto)

*/
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


class MotorBike: Vehicle {

	var numberOfWheels = 2

	init() {
		super.init(type: .motorBike)
	}

	//	(5)
	override class var makers : [VehicleMaker] {
		return [
			.Ducati,
			.Honda,
			.Yamaha,
		]
	}
}


//: [Next](@next)
