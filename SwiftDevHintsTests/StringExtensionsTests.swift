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
        XCTAssertEqual("Swift".md5.count, 32)
        XCTAssertEqual("Swift".md5, "ae832e9b5bda2699db45f3fa6aa8c556")
        XCTAssertEqual("Swift".md5, "Swift".md5)
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
    
    func testIntBaseHex() {
        XCTAssertEqual("FF".intBaseHex, 255)
        XCTAssertEqual("fe".intBaseHex, 254)
        XCTAssertEqual("fD".intBaseHex, 253)
        XCTAssertEqual("Fc".intBaseHex, 252)
        XCTAssertEqual("0xFc".intBaseHex, 252)
        XCTAssertNil("FG".intBaseHex)
    }
    
    func testNilIfEmpty() {
        XCTAssertEqual("Swift".nilIfEmpty, "Swift")
        XCTAssertNil("".nilIfEmpty)

        XCTAssertEqual(("Swift" as String?).nilIfEmpty, "Swift")
        XCTAssertNil(("" as String?).nilIfEmpty)
    }
}
