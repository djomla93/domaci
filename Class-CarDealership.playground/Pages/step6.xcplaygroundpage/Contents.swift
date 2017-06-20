//: [Previous](@previous)

import Foundation

//	# # Car Dealership # #
//	6. Dodati u svaku od 4 klase property koji predstavlja proizvođača, koji prihvata jednu vrednost iz spomenute liste mogućih. 
//	Taj property nije moguće promeniti nakon što se postavi.

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
	let maker: VehicleMaker	//	(6)

	init() {
		self.maker = VehicleMaker.Ducati	//	(6)
		super.init(type: .motorBike)
	}

	override class var makers : [VehicleMaker] {
		return [
			.Ducati,
			.Honda,
			.Yamaha,
		]
	}

	//	(6)
	init?(madeBy maker: VehicleMaker) {
		if !MotorBike.makers.contains(maker) {
			print("\(maker) is not a maker of MotorBikes")
			return nil
		}
		self.maker = maker
		super.init(type: .motorBike)
	}
}

//: [Next](@next)
