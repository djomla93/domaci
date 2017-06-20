//: [Previous](@previous)

import Foundation

var niz = [23,2,235,436,8,5,23,89,12,123,21,43]

func minMax() -> (min: Int, max: Int)? {

	if niz.count == 0 {
		return nil
	}

	var min = Int.max
	var max = Int.min
	for num in niz {
		if (num < min) {
			min = num
		}
		if (num > max) {
			max = num
		}
	}

	return (min, max)
}

minMax()


//: [Next](@next)
