//
//  RandomTests.swift
//  SwiftDevHints
//
//  Created by ZHOU DENGFENG on 14/7/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import XCTest
@testable import SwiftDevHints

class RandomTests: XCTestCase {
    
    func testRandom() {
        for _ in 0...100 {
            let range = Range<Int>(0...10)
            let randomInt = random(range)
            XCTAssert(randomInt >= 0)
            XCTAssert(randomInt <= 10)
        }
        for _ in 0...100 {
            let range = Range<Int>(1...9)
            let randomInt = random(range)
            XCTAssert(randomInt >= 1)
            XCTAssert(randomInt <= 9)
        }
    }
}
