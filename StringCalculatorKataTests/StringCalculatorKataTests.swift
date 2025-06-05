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
        #expect(calculator.add("") == 0)
    }

}
