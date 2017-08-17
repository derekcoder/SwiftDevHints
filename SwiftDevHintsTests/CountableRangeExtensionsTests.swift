//
//  CountableRangeExtensionsTests.swift
//  SwiftDevHintsTests
//
//  Created by Julie on 17/8/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import XCTest
@testable import SwiftDevHints

class CountableRangeExtensionsTests: XCTestCase {
        
    func testRandomInt() {
        for _ in 0...1000 {
            let num = (0...10).randomInt
            XCTAssert(num >= 0)
            XCTAssert(num <= 10)
        }
        
        for _ in 0...1000 {
            let num = (0..<10).randomInt
            XCTAssert(num >= 0)
            XCTAssert(num < 10)
        }
    }
}
