//
//  ArrayExtensionsTests.swift
//  SwiftDevHintsTests
//
//  Created by Derek on 17/10/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import XCTest
@testable import SwiftDevHints

class ArrayExtensionsTests: XCTestCase {
    
    func testAccumulate() {
     	let nums = [1, 2, 3, 4]
        XCTAssertEqual(nums.accumulate(0, +), [1, 3, 6, 10])
    }
}
