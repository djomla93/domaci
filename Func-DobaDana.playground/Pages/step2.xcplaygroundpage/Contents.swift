//: [Previous](@previous)

import Foundation

enum DayPeriod : Int {		//	values are hours, start of the period
	case dawn		= 6
	case morning	= 7
	case beforeNoon = 9
	case aroundNoon = 12
	case afterNoon	= 13
	case dusk		= 18
	case evening	= 19
	case night		= 22
}

func periodOfDay(atHour hour: Int, Minute min : Int) -> DayPeriod? {

	if hour > 23 || min > 59 {
		return nil
	}

	let totalMinutes = hour * 60 + min

	var period = DayPeriod.night
	if totalMinutes > period.rawValue * 60 || totalMinutes < DayPeriod.dawn.rawValue * 60 {
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

periodOfDay(atHour: 2, Minute: 0)
periodOfDay(atHour: 5, Minute: 30)
periodOfDay(atHour: 6, Minute: 01)
periodOfDay(atHour: 8, Minute: 0)
periodOfDay(atHour: 12, Minute: 0)
periodOfDay(atHour: 14, Minute: 30)
periodOfDay(atHour: 17, Minute: 15)
periodOfDay(atHour: 18, Minute: 15)
periodOfDay(atHour: 20, Minute: 45)
periodOfDay(atHour: 23, Minute: 30)

//: [Next](@next)
