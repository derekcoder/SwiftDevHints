//
//  IntExtensionsTests.swift
//  SwiftDevHints
//
//  Created by ZHOU DENGFENG on 17/7/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import XCTest
@testable import SwiftDevHints

class IntExtensionsTests: XCTestCase {
            
    func testIntFormat() {
        // 8
        let aInt: Int = 8
        let aInt8: Int8 = 8
        let aInt16: Int16 = 8
        let aInt32: Int32 = 8
        let aInt64: Int64 = 8
        XCTAssertEqual(aInt.format("03"), "008")
        XCTAssertEqual(aInt.format("3"), "  8")
        XCTAssertEqual(aInt8.format("03"), "008")
        XCTAssertEqual(aInt8.format("3"), "  8")
        XCTAssertEqual(aInt16.format("03"), "008")
        XCTAssertEqual(aInt16.format("3"), "  8")
        XCTAssertEqual(aInt32.format("03"), "008")
        XCTAssertEqual(aInt32.format("3"), "  8")
        XCTAssertEqual(aInt64.format("03"), "008")
        XCTAssertEqual(aInt64.format("3"), "  8")
    }
        
    func testUIntFormat() {
        // 8
        let aInt: UInt = 8
        let aInt8: UInt8 = 8
        let aInt16: UInt16 = 8
        let aInt32: UInt32 = 8
        let aInt64: UInt64 = 8
        XCTAssertEqual(aInt.format("03"), "008")
        XCTAssertEqual(aInt.format("3"), "  8")
        XCTAssertEqual(aInt8.format("03"), "008")
        XCTAssertEqual(aInt8.format("3"), "  8")
        XCTAssertEqual(aInt16.format("03"), "008")
        XCTAssertEqual(aInt16.format("3"), "  8")
        XCTAssertEqual(aInt32.format("03"), "008")
        XCTAssertEqual(aInt32.format("3"), "  8")
        XCTAssertEqual(aInt64.format("03"), "008")
        XCTAssertEqual(aInt64.format("3"), "  8")
    }
    
    func testNegativeIntFormat() {
        // -8
        let aInt: Int = -8
        XCTAssertEqual(aInt.format("003"), "-08")
        XCTAssertEqual(aInt.format("3"), " -8")
    }
    
    func testPrefixPlusPlus() {
        var i = 0
        XCTAssertEqual(++i, 1)
        XCTAssertEqual(i, 1)
    }
    
    func testPrefixMinusMinus() {
        var i = 0
        XCTAssertEqual(--i, -1)
        XCTAssertEqual(i, -1)
    }
    
    func testPostfixPlusPlus() {
        var i = 0
        XCTAssertEqual(i++, 0)
        XCTAssertEqual(i, 1)
    }
    
    func testPostfixMinusMinus() {
        var i = 0
        XCTAssertEqual(i--, 0)
        XCTAssertEqual(i, -1)
    }
    
    func testInt() {
        XCTAssertEqual(Int(1).int32, Int32(1))
        XCTAssertEqual(Int32(1).int, Int(1))
    }
    
    func testFloat() {
        XCTAssertEqual(Int(1).float, Float(1))
        XCTAssertEqual(Int32(1).float, Float(1))
    }
    
    func testDouble() {
        XCTAssertEqual(Int(1).double, Double(1))
        XCTAssertEqual(Int32(1).double, Double(1))
    }
    
    func testCGFloat() {
        XCTAssertEqual(Int(1).cgFloat, CGFloat(1))
        XCTAssertEqual(Int32(1).cgFloat, CGFloat(1))
    }
    
    func testString() {
        XCTAssertEqual(Int(1).string, "1")
        XCTAssertEqual(Int32(1).string, "1")
    }
}
