//
//  StringCalculator.swift
//  StringCalculatorKata
//
//  Created by Pratiksha on 05/06/25.
//

import Foundation

class StringCalculator {
    func add(_ numbers: String) throws -> Int {
        if numbers.isEmpty {
            return 0
        }
        
        // Generalize splitting and summing for any number of inputs
        let components = numbers.split(separator: ",")
        let sum = components.reduce(0) { (currentSum, component) in
            return currentSum + (Int(component) ?? 0)
        }
        return sum
    }
}
