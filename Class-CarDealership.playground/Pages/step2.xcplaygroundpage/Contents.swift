//: [Previous](@previous)

import Foundation

//	# # Car Dealership # #
//2. Unapred definisati listu proizvođača vozila na neki fiksan način, kako god mislite da je najbolje. Pojedinačni proizvođač neka bude običan String. Moguće vrednosti su:
//	Ducati, Honda, Yamaha, Renault, VW, Mercedes, Tesla, BMW, Iveco, Ferrari, Maserati

//	(1)
enum VehicleType {
	case motorBike, car, truck, bus
}

class Vehicle {
	let type: VehicleType

	init(type: VehicleType) {
		self.type = type
	}
}

//	(2)
enum VehicleMaker {
	case Ducati, Honda, Yamaha
	case Renault, VW, Mercedes, Tesla, BMW
	case Iveco
	case Ferrari, Maserati
}



//: [Next](@next)
