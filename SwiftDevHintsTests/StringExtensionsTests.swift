//
//  StringExtensionsTests.swift
//  SwiftDevHintsTests
//
//  Created by Julie on 17/8/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import XCTest
@testable import SwiftDevHints

class StringExtensionsTests: XCTestCase {
        
    func testMd5() {
        // hello
        XCTAssertEqual("hello".md5.count, 32)
        
        XCTAssertEqual("hello".md5, "hello".md5)
    }
    
    func testLocalized() {
        // hello
        XCTAssertEqual("hello".localized(), "hello")
        
        XCTAssertEqual("hello".localized(comment: "This is greeting words."), "hello")
    }
}
