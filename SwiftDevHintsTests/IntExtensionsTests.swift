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
}
