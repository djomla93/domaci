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
	/// - returns: DayPeriod value
	static func periodOfDay(atHour hour: Int,
	                        Minute min : Int = 0) -> DayPeriod? {

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
			return period
		}

		period = .evening
		if totalMinutes > period.minutes {
			return period
		}

		period = .dusk
		if totalMinutes > period.minutes {
			return period
		}

		period = .afterNoon
		if totalMinutes > period.minutes {
			return period
		}

		period = .aroundNoon
		if totalMinutes > period.minutes {
			return period
		}

		period = .beforeNoon
		if totalMinutes > period.minutes {
			return period
		}

		period = .morning
		if totalMinutes > period.minutes {
			return period
		}
		
		return .dawn
	}
}

DayPeriod.periodOfDay(atHour: 2)
DayPeriod.periodOfDay(atHour: 5, Minute: 30)
DayPeriod.periodOfDay(atHour: 6, Minute: 01)
DayPeriod.periodOfDay(atHour: 8)
DayPeriod.periodOfDay(atHour: 12)
DayPeriod.periodOfDay(atHour: 14, Minute: 30)
DayPeriod.periodOfDay(atHour: 17, Minute: 15)
DayPeriod.periodOfDay(atHour: 18, Minute: 15)
DayPeriod.periodOfDay(atHour: 20, Minute: 45)
DayPeriod.periodOfDay(atHour: 23, Minute: 59)

//	error handling
DayPeriod.periodOfDay(atHour: 24, Minute: 30)
DayPeriod.periodOfDay(atHour: 23, Minute: 60)

//: [Next](@next)
