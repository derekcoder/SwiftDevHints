//
//  CollectionExtensionsTests.swift
//  SwiftDevHintsTests
//
//  Created by Derek on 10/4/18.
//  Copyright © 2018 ZHOU DENGFENG DEREK. All rights reserved.
//

import XCTest
@testable import SwiftDevHints

class CollectionExtensionsTests: XCTestCase {
    func testSafeSubscript() {
        let animals = ["Zebra", "Giraffe", "Tiger"]
        XCTAssertEqual(animals[safe: 0], "Zebra")
        XCTAssertNil(animals[safe: 3])
    }
}
