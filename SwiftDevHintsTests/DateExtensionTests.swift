//
//  DateExtensionTests.swift
//  SwiftDevHintsTests
//
//  Created by Derek on 21/3/18.
//  Copyright © 2018 ZHOU DENGFENG DEREK. All rights reserved.
//

import XCTest
@testable import SwiftDevHints

class DateExtensionTests: XCTestCase {
    lazy var formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateFormat = "YYYY-MM-dd HH:mm:ss"
        return f
    }()
    
    func testIsInSameYear() {
        let d1 = formatter.date(from: "2018-03-09 10:59:02")!
        let d2 = formatter.date(from: "2018-06-02 18:32:35")!
        let d3 = formatter.date(from: "2016-08-28 11:48:09")!
        
        XCTAssertTrue(d1.isInSameYear(date: d2))
        XCTAssertFalse(d1.isInSameYear(date: d3))
    }
    
    func testIsInSameMonth() {
        let d1 = formatter.date(from: "2018-03-09 10:59:02")!
        let d2 = formatter.date(from: "2018-03-20 18:32:35")!
        let d3 = formatter.date(from: "2017-03-09 10:59:02")!
        
        XCTAssertTrue(d1.isInSameMonth(date: d2))
        XCTAssertFalse(d1.isInSameMonth(date: d3))
    }
    
    func testIsInSameWeek() {
        let d1 = formatter.date(from: "2018-01-01 10:59:02")! // Monday
        let d2 = formatter.date(from: "2017-12-31 18:32:35")! // Sunday
        let d3 = formatter.date(from: "2018-01-06 10:59:02")! // Saturday
        let d4 = formatter.date(from: "2017-12-30 10:59:02")! // Saturday
        let d5 = formatter.date(from: "2018-01-07 10:59:02")! // Sunday
        let d6 = formatter.date(from: "2017-01-01 10:59:02")! // Sunday
        
        XCTAssertTrue(d1.isInSameWeek(date: d2))
        XCTAssertTrue(d1.isInSameWeek(date: d3))
        XCTAssertFalse(d1.isInSameWeek(date: d4))
        XCTAssertFalse(d1.isInSameWeek(date: d5))
        XCTAssertFalse(d1.isInSameWeek(date: d6))
    }
    
    func testIsInSameDay() {
        let d1 = formatter.date(from: "2018-01-01 10:59:02")!
        let d2 = formatter.date(from: "2018-01-01 20:59:02")!
        let d3 = formatter.date(from: "2018-01-02 10:59:02")!
        let d4 = formatter.date(from: "2017-01-01 10:59:02")!
        
        XCTAssertTrue(d1.isInSameDay(date: d2))
        XCTAssertFalse(d1.isInSameDay(date: d3))
        XCTAssertFalse(d1.isInSameDay(date: d4))
    }
    
    func testIsWeekend() {
        let d1 = formatter.date(from: "2018-01-06 10:59:02")! // Saturday
        let d2 = formatter.date(from: "2018-01-07 10:59:02")! // Sunday
        let d3 = formatter.date(from: "2018-01-08 10:59:02")! // Monday

        XCTAssertTrue(d1.isWeekend)
        XCTAssertTrue(d2.isWeekend)
        XCTAssertFalse(d3.isWeekend)
    }
    
    func testIsThisWeek() {
        let d1 = formatter.date(from: "2018-01-06 10:59:02")! // Saturday
        let d2 = Date()
        
        XCTAssertFalse(d1.isThisWeek)
        XCTAssertTrue(d2.isThisWeek)
    }
    
    func testIsFuture() {
        let d1 = Date(timeIntervalSinceNow: 10 * 60)
        let d2 = Date(timeIntervalSinceNow: -10 * 60)
        XCTAssertTrue(d1.isFuture)
        XCTAssertFalse(d2.isFuture)
    }
    
    func testIsPast() {
        let d1 = Date(timeIntervalSinceNow: -10 * 60)
        let d2 = Date(timeIntervalSinceNow: 10 * 60)
        XCTAssertTrue(d1.isPast)
        XCTAssertFalse(d2.isPast)
    }
}
