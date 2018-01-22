//
//  SequenceExtensionsTests.swift
//  SwiftDevHintsTests
//
//  Created by Derek on 17/10/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import XCTest
@testable import SwiftDevHints

class SequenceExtensionsTests: XCTestCase {
    
    func testLast() {
     	let names = ["Derek", "Tony", "Jogn"]
        XCTAssertEqual(names.last { $0.hasPrefix("De") }!, "Derek")
    }
    
    func testAll() {
        let nums = [2, 4, 6, 8, 10]
        XCTAssertTrue(nums.all { $0 % 2 == 0 })
    }
}
