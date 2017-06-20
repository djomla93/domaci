//: [Previous](@previous)

import Foundation


func appendAndSort(numbers numbers1 : [Int], andNumbers numbers2: [Int]) -> [Int] {
	return (numbers1 + numbers2).sorted()
}

appendAndSort(numbers: [1,5,2,6], andNumbers: [])
appendAndSort(numbers: [1,5,2,6], andNumbers: [12,3,15])

func betterAppendAndSort(numbers numbers1 : [Int], and numbers2: [Int]) -> [Int] {
	return (numbers1 + numbers2).sorted()
}

betterAppendAndSort(numbers: [1,5,2,6], and: [12,23,32])

//: [Next](@next)
