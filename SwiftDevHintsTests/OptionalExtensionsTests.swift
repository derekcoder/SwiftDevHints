//
//  OptionalExtensionsTests.swift
//  SwiftDevHints
//
//  Created by ZHOU DENGFENG on 11/9/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import XCTest
@testable import SwiftDevHints

class OptionalExtensionsTests: XCTestCase {
    
    func testNilIfEmpty() {
        var string: String?
        
        string = ""
        XCTAssertNil(string.nilIfEmpty)
        
        string = nil
        XCTAssertNil(string.nilIfEmpty)
        
        string = " "
        XCTAssertNotNil(string.nilIfEmpty)
    }
    
    func testEmptyIfNil() {
        var string: String?
        
        string = nil
        XCTAssertEqual(string.emptyIfNil, "")
        
        string = "hello"
        XCTAssertEqual(string.emptyIfNil, "hello")
    }
    
    func testValueWithDefaultForString() {
        var string: String?
        
        string = nil
        XCTAssertEqual(string.value(withDefault: "default"), "default")
        
        string = "hello"
        XCTAssertEqual(string.value(withDefault: "default"), "hello")
    }
}
