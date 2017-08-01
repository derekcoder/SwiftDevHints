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
    
    func testRandom() {
        for _ in 0...100 {
            let range = Range<Int>(0...10)
            let num = Int.random(range)
            XCTAssert(num >= 0)
            XCTAssert(num <= 10)
        }
        
        for _ in 0...100 {
            let range = Range<Int>(1...9)
            let num = Int.random(range)
            XCTAssert(num >= 1)
            XCTAssert(num <= 9)
        }
    }
    
    func testFormat() {
        let aInt = 8
        XCTAssertEqual(aInt.format("03"), "008")
        XCTAssertEqual(aInt.format("3"), "  8")
    }
}
