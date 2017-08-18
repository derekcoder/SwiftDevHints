//
//  UIColorExtensionsTests.swift
//  SwiftDevHintsTests
//
//  Created by Julie on 18/8/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import XCTest
@testable import SwiftDevHints

class UIColorExtensionsTests: XCTestCase {
    func testInit() {
        // 255 0 255
        let color = UIColor(redIn255: 255, greenIn255: 0, blueIn255: 255, alphaIn100: 100)
        let color2 = UIColor(red: 1, green: 0, blue: 1, alpha: 1)

        XCTAssertEqual(color.intRGBAComponents.red, color2.intRGBAComponents.red)
        XCTAssertEqual(color.intRGBAComponents.green, color2.intRGBAComponents.green)
        XCTAssertEqual(color.intRGBAComponents.blue, color2.intRGBAComponents.blue)
        XCTAssertEqual(color.intRGBAComponents.alpha, color2.intRGBAComponents.alpha)
    }
    
    func testIntRGBAComponents() {
        // 255 0 255
        let color = UIColor(redIn255: 255, greenIn255: 0, blueIn255: 255, alphaIn100: 100)
		let comps = color.intRGBAComponents
        
        XCTAssertEqual(comps.red, 255)
        XCTAssertEqual(comps.green, 0)
        XCTAssertEqual(comps.blue, 255)
        XCTAssertEqual(comps.alpha, 100)
    }
    
    func testGRBAComponents() {
        // 255 0 255
        let color = UIColor(redIn255: 255, greenIn255: 0, blueIn255: 255, alphaIn100: 100)
        let comps = color.rgbaComponents
        
        XCTAssertEqual(comps.red, 1.0)
        XCTAssertEqual(comps.green, 0.0)
        XCTAssertEqual(comps.blue, 1.0)
        XCTAssertEqual(comps.alpha, 1.0)
    }
}
