//: [Previous](@previous)

import Foundation

var niz = [23,2,235,436,8,5,23,89,12,123,21,43]

func minMax(array: [Int]) -> (min: Int, max: Int)? {

	if array.count == 0 {
		return nil
	}

	var min = Int.max
	var max = Int.min
	for num in array {
		if (num < min) {
			min = num
		}
		if (num > max) {
			max = num
		}
	}

	return (min, max)
}

minMax(array: niz)


//: [Next](@next)
