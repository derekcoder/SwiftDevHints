//
//  BundleExtensions.swift
//  SwiftDevHintsTests
//
//  Created by Julie on 16/10/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import XCTest
@testable import SwiftDevHints

class BundleExtensionsTests: XCTestCase {
    
    let bundle = Bundle(for: BundleExtensionsTests.self)
    
    func testName() {
        XCTAssertEqual(bundle.name!, "SwiftDevHintsTests")
    }
    
    func testDisplayName() {
        XCTAssertEqual(bundle.displayName, nil)
    }
    
    func testDevelopmentRegion() {
        XCTAssertEqual(bundle.developmentRegion!, "en")
    }
    
    func testIdentifier() {
        XCTAssertEqual(bundle.identifier!, "com.derekcoder.SwiftDevHintsTests")
    }
    
    func testVersion() {
        XCTAssertEqual(bundle.version!, "1.0")
    }
    
    func testBuild() {
        XCTAssertEqual(bundle.build!, "1")
    }
    
    func testPackageType() {
        XCTAssertEqual(bundle.packageType!, "BNDL")
    }
}
