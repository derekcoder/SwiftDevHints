//
//  StringExtensionsTests.swift
//  SwiftDevHintsTests
//
//  Created by ZHOU DENGFENG on 17/8/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import XCTest
@testable import SwiftDevHints

class StringExtensionsTests: XCTestCase {
    func testSafeSubscriptForCountableRange() {
        let string = "Hello, Swift!"
        XCTAssertEqual(string[safe: 0..<5], "Hello")
        XCTAssertNil(string[safe: 0..<14])
    }
    
    func testSafeSubscriptForClosedRange() {
        let string = "Hello, Swift!"
        XCTAssertEqual(string[safe: 0...4], "Hello")
        XCTAssertNil(string[safe: 0...13])
    }
    
    func testMd5() {
        // hello
        XCTAssertEqual("hello".md5.count, 32)
        
        XCTAssertEqual("hello".md5, "hello".md5)
        print("hello".md5)
    }
    
    func testCapitalizingFirstLetter() {
        XCTAssertEqual("".capitalizingFirstLetter(), "")
        XCTAssertEqual(" ".capitalizingFirstLetter(), " ")
        XCTAssertEqual("hello".capitalizingFirstLetter(), "Hello")
    }
    
    func testCapitalizeFirstLetter() {
        var string = ""
        string.capitalizeFirstLetter()
        XCTAssertEqual(string, "")
        
        string = " "
        string.capitalizeFirstLetter()
        XCTAssertEqual(string, " ")

        string = "hello"
        string.capitalizeFirstLetter()
        XCTAssertEqual(string, "Hello")
    }
    
    func testLocalized() {
        // hello
        XCTAssertEqual("hello".localized(), "hello")
        
        XCTAssertEqual("hello".localized(comment: "This is greeting words."), "hello")
    }
}
