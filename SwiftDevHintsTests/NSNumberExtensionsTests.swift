//
//  NSNumberExtensionsTests.swift
//  SwiftDevHintsTests
//
//  Created by Julie on 1/8/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import XCTest
@testable import SwiftDevHints

class NSNumberExtensionsTests: XCTestCase {
    
    func testIsBool() {
        var aNumber = NSNumber(value: true)
        XCTAssertTrue(aNumber.isBool)
        
        aNumber = false as NSNumber
        XCTAssertTrue(aNumber.isBool)
        
        aNumber = NSNumber(value: 1)
        XCTAssertFalse(aNumber.isBool)
        
        aNumber = NSNumber(value: 1.0)
        XCTAssertFalse(aNumber.isBool)
    }
}
