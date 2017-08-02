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
     	let aDouble = 3.14159265
        XCTAssertEqual(aDouble.format(".2"), "3.14")
        XCTAssertEqual(aDouble.format(".3"), "3.142")
    }
    
    func testRoundTo() {
        let aDouble = 3.14159265
        XCTAssertEqual(aDouble.roundTo(places: 2), 3.14)
        XCTAssertEqual(aDouble.roundTo(places: 3), 3.142)
    }
}
