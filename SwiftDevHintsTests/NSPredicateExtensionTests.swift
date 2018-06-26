//
//  NSPredicateExtensionTests.swift
//  SwiftDevHintsTests
//
//  Created by Derek on 22/6/18.
//  Copyright © 2018 ZHOU DENGFENG DEREK. All rights reserved.
//

import XCTest
@testable import SwiftDevHints

class NSPredicateExtensionTests: XCTestCase {
    
    func testAndPredicate() {
        let p1 = NSPredicate(format: "id == 123")
        let p2 = NSPredicate(format: "name == derek")
        let p = NSPredicate(format: "id == 123 AND name == derek")
        let andP = p1.andPredicate(p2)
        
        XCTAssertEqual(p.predicateFormat, andP.predicateFormat)
    }
    
    func testOrPredicate() {
        let p1 = NSPredicate(format: "id == 123")
        let p2 = NSPredicate(format: "name == derek")
        let p = NSPredicate(format: "id == 123 OR name == derek")
        let orP = p1.orPredicate(p2)
        
        XCTAssertEqual(p.predicateFormat, orP.predicateFormat)
    }
    
    func testNotPredicate() {
        let p = NSPredicate(format: "id == 123")
        let notP = NSPredicate(format: "NOT id == 123")
        
        XCTAssertEqual(notP.predicateFormat, p.notPredicate.predicateFormat)
    }
}
