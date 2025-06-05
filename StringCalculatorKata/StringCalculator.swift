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
        
        var currentDelimiters = CharacterSet(charactersIn: ",\n")
        var numbersToParse = numbers
        
        // Check for custom delimiter format: //(delimiter)\n
        if numbers.hasPrefix("//") {
            // Regex to capture custom character delimiter
            if let match = numbers.firstMatch(of: #/\/\/(.)\n(.*)/#) {
                let customDelimiter = String(match.1)
                currentDelimiters.insert(charactersIn: customDelimiter)
                numbersToParse = String(match.2)
            }
        }
        
        let components = numbersToParse.components(separatedBy: currentDelimiters).filter {!$0.isEmpty }
        
        let sum = components.reduce(0) { (currentSum, component) in
            return currentSum + (Int(component) ?? 0)
        }
        return sum
    }
}
