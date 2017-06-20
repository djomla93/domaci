//: [Previous](@previous)

import Foundation

//	prva opcija
var niz = [23,2,235,436,8,5,23,89,12,123,21,43]

func append(numbers : [Int]) {
	niz += numbers
}

niz
append(numbers: [10,11,12])
niz


//	druga
var niz2 = [23,2,235,436,8,5,23,89,12,123,21,43]

func arrayAfterAppending(numbers: [Int]) -> [Int] {
	return niz2 + numbers
}

niz2
arrayAfterAppending(numbers: [15,16])
niz2


//: [Next](@next)
