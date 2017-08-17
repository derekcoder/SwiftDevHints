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
            
    func testFormat() {
        let aInt = 8
        XCTAssertEqual(aInt.format("03"), "008")
        XCTAssertEqual(aInt.format("3"), "  8")
    }
}
