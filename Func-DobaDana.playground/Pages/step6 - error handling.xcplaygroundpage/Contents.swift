//: [Previous](@previous)

import Foundation

/// Values are in hours, start of the period. Say 6:00 is start of dawn
enum DayPeriod : Int {
	case dawn		= 6
	case morning	= 7
	case beforeNoon = 9
	case aroundNoon = 12
	case afterNoon	= 13
	case dusk		= 18
	case evening	= 19
	case night		= 22

	/// Returns the rawValue (which is in hours) converted into minutes
	var minutes : Int {
		return self.rawValue * 60
	}

	/// Returns period of day for the given time
	///
	/// - parameter hour: integer value between 0 and 23
	/// - parameter min:  integer value between 0 and 59
	///
	/// - returns: (optional) DayPeriod value. If any of the supplied values is outside the given bounds, it will return nil
	init(atHour hour: Int, Minute min : Int = 0) throws {

		//	na samom početku se radi validacija podataka
		if hour > 23 || min > 59 {
			throw DayPeriodError.invalid(hours: (hour > 23) ? hour : nil,
			                             minutes: (min > 59) ? min : nil)
		}
		//	tek ako je sve u redu, pišemo telo funkcije

		//	konvertujemo sve u minute i onda proveravamo na osnovu toga
		let totalMinutes = hour * 60 + min

		//	obzirom da moj model predstavlja sate kao *početak* perioda, onda u proveru krećem od kraja, tj. od noći i idem nadole, ka zori

		var period = DayPeriod.night
		if	totalMinutes > period.minutes ||
			totalMinutes < DayPeriod.dawn.minutes
		{
			//	kada se pronađe koji je period, onda se to dodeli kao vrednost self
			self = period
			//	i onda obavezno ide izlazak iz init metoda, inače bi procesiranje koda nastavilo dalje
			return
		}

		period = .evening
		if totalMinutes > period.minutes {
			self = period
			return
		}

		period = .dusk
		if totalMinutes > period.minutes {
			self = period
			return
		}

		period = .afterNoon
		if totalMinutes > period.minutes {
			self = period
			return
		}

		period = .aroundNoon
		if totalMinutes > period.minutes {
			self = period
			return
		}

		period = .beforeNoon
		if totalMinutes > period.minutes {
			self = period
			return
		}

		period = .morning
		if totalMinutes > period.minutes {
			self = period
			return
		}

		self = period
	}
}


//	Declaration of possible errors
enum DayPeriodError: Error {

	case generic

	case invalid(hours: Int?, minutes: Int?)
}



//	There are 4 ways to handle possible errors

//	(1) do nothing
//	thrown error will propagate from inside the function to the code that called that function
func test() throws -> DayPeriod {
	return DayPeriod(atHour: 23, Minute: 60)
}
//test()

//	(2) handle the error using a do-catch statement

//	handle all possible errors, without care what the error is
do {
	try DayPeriod(atHour: 23, Minute: 60)
	print("")

} catch {
	print("Oooops, my bad!")
}

//	handle all possible error, but with access to actual error
do {
	try DayPeriod(atHour: 23, Minute: 60)

} catch(let e) {
	print("Oooops, my bad! \(e)")
}

//	handle one of possible errors in certain way and then fallback for any other
do {
	try DayPeriod(atHour: 23, Minute: 60)

} catch DayPeriodError.generic {
	print("Generic bad!")

} catch {
	print("Oooops, my bad!")
}

//	handle error and look into specific values
do {
	try DayPeriod(atHour: 23, Minute: 60)

} catch DayPeriodError.invalid(let h, let m) {
	if let h = h {
		print("Invalid value for hours: \(h)")
	}
	if let m = m {
		print("Invalid value for minutes: \(m)")
	}

} catch {
	print("Oooops, my bad!")
}

//and what about when there's no error?
do {
	let period = try DayPeriod(atHour: 21, Minute: 49)
	print(period)

} catch {
	print("Oooops, my bad!")
}




//	(3) handle the error as an optional value
let day3 = try? DayPeriod(atHour: 24, Minute: 30)
type(of: day3)




//	(4) walk on the edge and assume that the error will not occur
let day4 = try! DayPeriod(atHour: 2)
//let day5 = try! DayPeriod(atHour: 26)




//: [Next](@next)
