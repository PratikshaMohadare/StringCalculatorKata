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
        
        // IMP: When parsing textfield input, treat \\n as \n
        let numberString = numbers.replacingOccurrences(of: "\\n", with: "\n")

        let (delimiters, numbersToParse) = extractDelimiterAndNumbers(from: numberString)
        
        let components = numbersToParse.components(separatedBy: delimiters)
                                     .filter {!$0.isEmpty } // Remove empty strings that result from splitting

        let parsedNumbers = components.compactMap { Int($0) }

        // Collect negative numbers
        let negativeNumbers = parsedNumbers.filter { $0 < 0 }

        // Throw error if any negative numbers are found
        if !negativeNumbers.isEmpty {
            throw CalculatorError.negativesNotAllowed(numbers: negativeNumbers)
        }

        // So, all parsed numbers are included in the sum.
        let numbersToSum = parsedNumbers
        
        let sum = numbersToSum.reduce(0, +)
        return sum
    }
    
    // Refactored helper function
    private func extractDelimiterAndNumbers(from input: String) -> (delimiter: CharacterSet, numbers: String) {
        var defaultDelimiters = CharacterSet(charactersIn: ",\n")
        
        // Check for custom delimiter format: //(single_char_delimiter)\n
        if input.hasPrefix("//") {
            let regex = #/\/\/(.)\n(.*)/#
            
            if let match = input.firstMatch(of: regex) {
                let customDelimiter = String(match.output.1) // The captured single character delimiter
                defaultDelimiters.insert(charactersIn: customDelimiter)
                let numbersPart = String(match.output.2) // The rest of the string after the custom delimiter line
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
