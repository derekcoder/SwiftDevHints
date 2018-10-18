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
        
        let names = ["Derek", "", "John", "", "Tony", nil]
        let validNames = names.compactMap { $0.nilIfEmpty }
        XCTAssertEqual(validNames, ["Derek", "John", "Tony"])
    }
}
