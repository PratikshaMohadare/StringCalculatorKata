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
        
        // Convert the string to an integer. If conversion fails, default to 0.
        return Int(numbers) ?? 0
    }
}
