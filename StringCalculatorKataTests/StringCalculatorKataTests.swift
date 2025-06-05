//
//  StringCalculatorKataTests.swift
//  StringCalculatorKataTests
//
//  Created by Pratiksha on 05/06/25.
//

import Testing
@testable import StringCalculatorKata

struct StringCalculatorKataTests {
    var calculator: StringCalculator
    
    init() {
        // Initialize a fresh calculator instance before all tests in this struct
        calculator = StringCalculator()
    }
    
    @Test func test_add_emptyString_returnsZero() {
        #expect(try! calculator.add("") == 0, "An empty string input should result in 0.")
    }

    @Test func test_add_singleNumber_returnsItsValue() {
        #expect(try! calculator.add("0") == 0, "Input '0' should return 0.")
        #expect(try! calculator.add("5") == 5, "Input '5' should return 5.")
        #expect(try! calculator.add("9") == 9, "Input '9' should return 9.")

    }
}
