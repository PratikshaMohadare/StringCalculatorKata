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
        
        let components = numbers.split(separator: ",")
        
        // Simplest implementation for two numbers
        if components.count == 2 {
            let num1 = Int(components[0]) ?? 0
            let num2 = Int(components[1]) ?? 0
            return num1 + num2
        }
        
        // Convert the string to an integer. If conversion fails, default to 0.
        return Int(numbers) ?? 0
    }
}
