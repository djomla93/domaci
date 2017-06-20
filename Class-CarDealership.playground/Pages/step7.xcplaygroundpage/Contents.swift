//: [Previous](@previous)

import Foundation

//	# # Car Dealership # #
//	7. Kreirati više konkretnih objekata za svaku od klasa

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

Vehicle.makers
//let vozilo = Vehicle(type: .bus)
//vozilo.ma

class MotorBike: Vehicle {

	var numberOfWheels = 2
	let maker: VehicleMaker

	init() {
		fatalError("`init()` is not available, please use `init?(madeBy:)")
	}

	override class var makers : [VehicleMaker] {
		return [
			.Ducati,
			.Honda,
			.Yamaha,
		]
	}

	init?(madeBy maker: VehicleMaker) {
		if !MotorBike.makers.contains(maker) {
			print("\(maker) is not a maker of MotorBikes")
			return nil
		}
		self.maker = maker
		super.init(type: .motorBike)
	}
}


//	(7)
var honda = MotorBike(madeBy: .Honda)

//var ducati = MotorBike()

//var ferrari = MotorBike(madeBy: .Ferrari)

//: [Next](@next)
