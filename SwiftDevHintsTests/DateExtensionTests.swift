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
    
    func testEra() {
        let date = Date(timeIntervalSince1970: 123456.789)
        XCTAssertEqual(date.era, 1)
    }
    
    func testYear() {
        var date = Date(timeIntervalSince1970: 123456.789)
        XCTAssertEqual(date.year, 1970)
        
        date.year = -1
        XCTAssertEqual(date.year, 1970)
        
        date.year = 1988
        XCTAssertEqual(date.year, 1988)
        
        date.year = 2018
        XCTAssertEqual(date.year, 2018)
    }
    
    func testWeekOfYear() {
        let date = Date(timeIntervalSince1970: 123456.789)
        XCTAssertEqual(date.weekOfYear, 1)
        
        let newDate = Calendar.current.date(byAdding: .day, value: 7, to: date)!
        XCTAssertEqual(newDate.weekOfMonth, 2)
    }
    
    func testMonth() {
        var date = Date(timeIntervalSince1970: 123456.789)
        XCTAssertEqual(date.month, 1)
        
        date.month = -1
        XCTAssertEqual(date.month, 1)
        
        date.month = 13
        XCTAssertEqual(date.month, 1)
        
        date.month = 2
        XCTAssertEqual(date.month, 2)
        
        date.month = 11
        XCTAssertEqual(date.month, 11)
    }
    
    func testWeekday() {
        let date = Date(timeIntervalSince1970: 123456.789)
        XCTAssertEqual(date.weekday, 6)
    }
    
    func testWeekOfMonth() {
        let date = Date(timeIntervalSince1970: 123456.789)
        XCTAssertEqual(date.weekOfMonth, 1)
        
        let newDate = Calendar.current.date(byAdding: .day, value: 7, to: date)!
        XCTAssertEqual(newDate.weekOfMonth, 2)
    }
    
    func testDay() {
        var date = Date(timeIntervalSince1970: 123456.789)
        XCTAssertEqual(date.day, 2)
        
        date.day = -1
        XCTAssertEqual(date.day, 2)

        date.day = 32
        XCTAssertEqual(date.day, 2)

        date.day = 1
        XCTAssertEqual(date.day, 1)

        date.day = 13
        XCTAssertEqual(date.day, 13)
    }
    
    func testHour() {
        var date = Date(timeIntervalSince1970: 123456.789)
        XCTAssertEqual(date.hour, 17)
        
        date.hour = -1
        XCTAssertEqual(date.hour, 17)
        
        date.hour = 25
        XCTAssertEqual(date.hour, 17)
        
        date.hour = 1
        XCTAssertEqual(date.hour, 1)
        
        date.hour = 13
        XCTAssertEqual(date.hour, 13)
    }
    
    func testMinute() {
        var date = Date(timeIntervalSince1970: 123456.789)
        XCTAssertEqual(date.minute, 47)
        
        date.minute = -1
        XCTAssertEqual(date.minute, 47)
        
        date.minute = 61
        XCTAssertEqual(date.minute, 47)
        
        date.minute = 1
        XCTAssertEqual(date.minute, 1)

        date.minute = 13
        XCTAssertEqual(date.minute, 13)
    }
    
    func testSecond() {
        var date = Date(timeIntervalSince1970: 123456.789)
        XCTAssertEqual(date.second, 36)
        
        date.second = -1
        XCTAssertEqual(date.second, 36)
        
        date.second = 61
        XCTAssertEqual(date.second, 36)

        date.second = 1
        XCTAssertEqual(date.second, 1)
        
        date.second = 13
        XCTAssertEqual(date.second, 13)
    }
}
