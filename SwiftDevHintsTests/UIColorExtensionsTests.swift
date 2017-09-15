//
//  UIColorExtensionsTests.swift
//  SwiftDevHintsTests
//
//  Created by ZHOU DENGFENG on 18/8/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import XCTest
@testable import SwiftDevHints

class UIColorExtensionsTests: XCTestCase {
    func testInit() {
        // 255 0 255
        let color = UIColor(redIn255: 255, greenIn255: 0, blueIn255: 255, alphaIn100: 100)
        let color2 = UIColor(red: 1, green: 0, blue: 1, alpha: 1)

        XCTAssertEqual(color.intRGBA.red, color2.intRGBA.red)
        XCTAssertEqual(color.intRGBA.green, color2.intRGBA.green)
        XCTAssertEqual(color.intRGBA.blue, color2.intRGBA.blue)
        XCTAssertEqual(color.intRGBA.alpha, color2.intRGBA.alpha)
    }
    
    func testIntRGBAComponents() {
        // 255 0 255
        let color = UIColor(redIn255: 255, greenIn255: 0, blueIn255: 255, alphaIn100: 100)
		let comps = color.intRGBA
        
        XCTAssertEqual(comps.red, 255)
        XCTAssertEqual(comps.green, 0)
        XCTAssertEqual(comps.blue, 255)
        XCTAssertEqual(comps.alpha, 100)
    }
    
    func testGRBAComponents() {
        // 255 0 255
        let color = UIColor(redIn255: 255, greenIn255: 0, blueIn255: 255, alphaIn100: 100)
        let comps = color.rgba
        
        XCTAssertEqual(comps.red, 1.0)
        XCTAssertEqual(comps.green, 0.0)
        XCTAssertEqual(comps.blue, 1.0)
        XCTAssertEqual(comps.alpha, 1.0)
    }
}
