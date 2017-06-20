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
	init?(atHour hour: Int, Minute min : Int = 0) {

		//	na samom početku se radi validacija podataka
		if hour > 23 || min > 59 {
			return nil
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

DayPeriod(atHour: 2)
DayPeriod.init(atHour: 5, Minute: 30)
DayPeriod(atHour: 6, Minute: 01)
DayPeriod(atHour: 8)
DayPeriod(atHour: 12)
DayPeriod.init(atHour: 14, Minute: 30)
DayPeriod(atHour: 17, Minute: 15)
DayPeriod(atHour: 18, Minute: 15)
DayPeriod(atHour: 20, Minute: 45)
DayPeriod(atHour: 23, Minute: 59)

//	error handling
DayPeriod(atHour: 24, Minute: 30)
DayPeriod(atHour: 23, Minute: 60)

//: [Next](@next)
