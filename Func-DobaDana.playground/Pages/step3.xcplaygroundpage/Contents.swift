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
}

/// Returns period of day for the given time
///
/// - parameter hour: integer value between 0 and 23
/// - parameter min:  integer value between 0 and 59
///
/// - returns: DayPeriod value
func periodOfDay(atHour hour: Int,
                 Minute min : Int = 0) -> DayPeriod? {

	//	na samom početku se radi validacija podataka
	if hour > 23 || min > 59 {
		return nil
	}
	//	tek ako je sve u redu, pišemo telo funkcije

	//	konvertujemo sve u minute i onda proveravamo na osnovu toga
	let totalMinutes = hour * 60 + min

	var period = DayPeriod.night
	if	totalMinutes > period.rawValue * 60 ||
		totalMinutes < DayPeriod.dawn.rawValue * 60
	{
		return period
	}

	period = .evening
	if totalMinutes > period.rawValue * 60 {
		return period
	}

	period = .dusk
	if totalMinutes > period.rawValue * 60 {
		return period
	}

	period = .afterNoon
	if totalMinutes > period.rawValue * 60 {
		return period
	}

	period = .aroundNoon
	if totalMinutes > period.rawValue * 60 {
		return period
	}

	period = .beforeNoon
	if totalMinutes > period.rawValue * 60 {
		return period
	}

	period = .morning
	if totalMinutes > period.rawValue * 60 {
		return period
	}

	return .dawn
}

periodOfDay(atHour: 2)
periodOfDay(atHour: 5, Minute: 30)
periodOfDay(atHour: 6, Minute: 01)
periodOfDay(atHour: 8)
periodOfDay(atHour: 12)
periodOfDay(atHour: 14, Minute: 30)
periodOfDay(atHour: 17, Minute: 15)
periodOfDay(atHour: 18, Minute: 15)
periodOfDay(atHour: 20, Minute: 45)
periodOfDay(atHour: 23, Minute: 59)

//	error handling
periodOfDay(atHour: 24, Minute: 30)
periodOfDay(atHour: 23, Minute: 60)

//: [Next](@next)
