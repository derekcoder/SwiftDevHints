//
//  FloatExtensionsTests.swift
//  SwiftDevHintsTests
//
//  Created by Derek on 12/7/19.
//  Copyright © 2019 ZHOU DENGFENG DEREK. All rights reserved.
//

import XCTest
@testable import SwiftDevHints

class FloatExtensionsTests: XCTestCase {

    func testInt() {
        XCTAssertEqual(Float(1.2).int, Int(1))
        XCTAssertEqual(Float(1).int, Int(1))
        XCTAssertEqual(CGFloat(1.2).int, Int(1))
        XCTAssertEqual(CGFloat(1).int, Int(1))
    }
    
    func testInt32() {
        XCTAssertEqual(Float(1.2).int32, Int32(1))
        XCTAssertEqual(CGFloat(1.2).int32, Int32(1))
    }
    
    func testDouble() {
        XCTAssertEqual(Float(1.2).double, Double(1.2), accuracy: 0.000001)
        XCTAssertEqual(CGFloat(1.2).double, Double(1.2), accuracy: 0.000001)
    }
    
    func testFloat() {
        XCTAssertEqual(Float(1.2).cgFloat, CGFloat(1.2), accuracy: 0.000001)
        XCTAssertEqual(CGFloat(1.2).float, Float(1.2), accuracy: 0.000001)
    }
    
    func testString() {
        XCTAssertEqual(Float(1.2).string, "1.2")
        XCTAssertEqual(CGFloat(1.2).string, "1.2")
    }
}
