//
//  SHA1Tests.swift
//  SwiftDevHintsTests
//
//  Created by Derek on 2/1/18.
//  Copyright © 2018 ZHOU DENGFENG DEREK. All rights reserved.
//

import XCTest
@testable import SwiftDevHints

class SHA1Tests: XCTestCase {
    
    func testStringSha() {
        let string = "abc"
        XCTAssertEqual(SHA1.hexString(from: string), "A9993E36 4706816A BA3E2571 7850C26C 9CD0D89D")
    }
}
