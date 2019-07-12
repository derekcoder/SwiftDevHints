//
//  DoubleExtensionsTests.swift
//  SwiftDevHintsTests
//
//  Created by ZHOU DENGFENG on 1/8/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import XCTest
@testable import SwiftDevHints

class DoubleExtensionsTests: XCTestCase {
    
    func testFormat() {
     	let positiveDouble = 3.14159265
        let negativeDouble = -3.14159265
        XCTAssertEqual(positiveDouble.format(".2"), "3.14")
        XCTAssertEqual(positiveDouble.format(".3"), "3.142")
        XCTAssertEqual(negativeDouble.format(".2"), "-3.14")
        XCTAssertEqual(negativeDouble.format(".3"), "-3.142")
    }
    
    func testRoundTo() {
        let aDouble = 3.14159265
        XCTAssertEqual(aDouble.roundTo(places: 2), 3.14)
        XCTAssertEqual(aDouble.roundTo(places: 3), 3.142)
    }
    
    func testInt() {
        XCTAssertEqual(Double(1.2).int, Int(1))
        XCTAssertEqual(Double(1).int, Int(1))
    }
    
    func testInt32() {
        XCTAssertEqual(Double(1.2).int32, Int32(1))
    }

    func testFloat() {
        XCTAssertEqual(Double(1.2).float, Float(1.2))
    }

    func testCGFloat() {
        XCTAssertEqual(Double(1.2).cgFloat, CGFloat(1.2))
    }

    func testString() {
        XCTAssertEqual(Double(1.2).string, "1.2")
    }
}
