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
        
        let (delimiters, numbersToParse) = extractDelimiterAndNumbers(from: numbers)
        
        let components = numbersToParse.components(separatedBy: delimiters).filter {!$0.isEmpty }
        
        let sum = components.reduce(0) { (currentSum, component) in
            return currentSum + (Int(component) ?? 0)
        }
        return sum
    }
    
    // Refactored helper function
    private func extractDelimiterAndNumbers(from input: String) -> (delimiter: CharacterSet, numbers: String) {
        var defaultDelimiters = CharacterSet(charactersIn: ",\n")
        
        if input.hasPrefix("//") {
            let regex = #/\/\/(?:(.)|\[(.*?)\])\n(.*)/#
            
            if let match = input.firstMatch(of: regex) {
                if let singleCharDelimiter = match.output.1 {
                    defaultDelimiters.insert(charactersIn: String(singleCharDelimiter))
                } else if let multiCharDelimiter = match.output.2 {
                    defaultDelimiters.insert(charactersIn: String(multiCharDelimiter))
                }
                let numbersPart = String(match.output.3)
                return (defaultDelimiters, numbersPart)
            }
        }
        
        return (defaultDelimiters, input)
    }
}

enum CalculatorError: Error, CustomStringConvertible, Equatable {
    case negativesNotAllowed(numbers: [Int])

    var description: String {
        switch self {
        case.negativesNotAllowed(let numbers):
            let negativeList = numbers.map { String($0) }.joined(separator: ", ")
            return "negatives not allowed: \(negativeList)"
        }
    }

    static func == (lhs: CalculatorError, rhs: CalculatorError) -> Bool {
        switch (lhs, rhs) {
        case (.negativesNotAllowed(let lhsNumbers),.negativesNotAllowed(let rhsNumbers)):
            return lhsNumbers == rhsNumbers
        }
    }
}
