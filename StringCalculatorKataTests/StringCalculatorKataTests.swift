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
    
    @Test func test_add_twoNumbersCommaSeparated_returnsSum() {
        #expect(try! calculator.add("1,2") == 3, "Input '1,2' should return 3.")
        #expect(try! calculator.add("9,23") == 32, "Input '9,23' should return 32.")
        #expect(try! calculator.add("12,45") == 57, "Input '12,45' should return 57.")
    }
    
    @Test func test_add_multipleNumbersCommaSeparated_returnsSum() {
        // Arrange
        // Act & Assert
        #expect(try! calculator.add("1,2,3") == 6, "Input '1,2,3' should return 6.")
        #expect(try! calculator.add("1558,2,2442") == 4002, "Input '1558,2,2442' should return 4002.")
        #expect(try! calculator.add("15,22,45,79") == 161, "Input '15,22,45,79' should return 161.")
        #expect(try! calculator.add("2") == 2, "Input '2' should return 2 (regression test).")
    }

    @Test func test_add_newlinesAsDelimiters_returnsSum() {
        #expect(try! calculator.add("1\n2,3") == 6, "Input '1\\n2,3' should return 6.")
        #expect(try! calculator.add("1\n2") == 3, "Input '1\\n2' should return 3.")
    }
    
    @Test func test_add_customDelimiters_returnsSum() {
        #expect(try! calculator.add("//;\n2;5") == 7, "Input '//;\\n2;5' should return 7.")
        #expect(try! calculator.add("//-\n1-2") == 3, "Input '//-\\n1-2' should return 3.")
        #expect(try! calculator.add("//#\n1#2#3") == 6, "Input '//#\\n1#2#3' should return 6.")
    }
}
