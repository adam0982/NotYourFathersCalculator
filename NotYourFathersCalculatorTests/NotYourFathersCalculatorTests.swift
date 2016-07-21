//
//  NotYourFathersCalculatorTests.swift
//  NotYourFathersCalculatorTests
//
//  Created by Adam Serruys on 4/23/16.
//  Copyright © 2016 Adam Serruys. All rights reserved.
//

import XCTest
@testable import NotYourFathersCalculator

class NotYourFathersCalculatorTests: XCTestCase {
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAddition() {
        let testCM = CalculatorModel()
        XCTAssertEqual(testCM.performOperation(3.0, operandTwo: 5.0, operation: "+"), 8.0,"Result should be 8.0")
    }
    
    func testSubtraction() {
        let testCM = CalculatorModel()
        XCTAssertEqual(testCM.performOperation(9.0, operandTwo: 4.0, operation: "−"), 5.0,"Result should be 5.0")
    }
    
    func testMultiplication() {
        let testCM = CalculatorModel()
        XCTAssertEqual(testCM.performOperation(11.0, operandTwo: 9.0, operation: "×"), 99.0,"Result should be 99.0")
    }
    
    func testDivision() {
        let testCM = CalculatorModel()
        XCTAssertEqual(testCM.performOperation(250.5, operandTwo: 5.0, operation: "÷"), 50.1,"Result should be 50.1")
    }
   
//    func testExample() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measureBlock {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
    
}
