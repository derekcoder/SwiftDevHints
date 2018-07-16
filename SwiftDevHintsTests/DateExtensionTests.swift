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
    func testNext() {
        let date = Date(timeIntervalSince1970: 123456.789)  // 1970-01-02 17:47:36 +0000
        XCTAssertEqual(date.next(of: .year)?.year, 1971)
        XCTAssertEqual(date.next(of: .month)?.month, 2)
        XCTAssertEqual(date.next(of: .weekOfYear)?.weekOfYear, 2)
        XCTAssertEqual(date.next(of: .weekOfMonth)?.weekOfMonth, 2)
        XCTAssertEqual(date.next(of: .day)?.day, 3)
        XCTAssertEqual(date.next(of: .hour)?.hour, 18)
        XCTAssertEqual(date.next(of: .minute)?.minute, 48)
        XCTAssertEqual(date.next(of: .second)?.second, 37)
    }
    
    func testPrevious() {
        let date = Date(timeIntervalSince1970: 123456.789)  // 1970-01-02 17:47:36 +0000
        XCTAssertEqual(date.previous(of: .year)?.year, 1969)
        XCTAssertEqual(date.previous(of: .month)?.month, 12)
        XCTAssertEqual(date.previous(of: .weekOfYear)?.weekOfYear, 52)
        XCTAssertEqual(date.previous(of: .weekOfMonth)?.weekOfMonth, 4)
        XCTAssertEqual(date.previous(of: .day)?.day, 1)
        XCTAssertEqual(date.previous(of: .hour)?.hour, 16)
        XCTAssertEqual(date.previous(of: .minute)?.minute, 46)
        XCTAssertEqual(date.previous(of: .second)?.second, 35)
    }
    
    func testBeginning() {
        let now = Date()
        
        XCTAssertEqual(now.beginning(of: .second)?.nanosecond, 0)
        
        XCTAssertEqual(now.beginning(of: .minute)?.second, 0)
        XCTAssertEqual(now.beginning(of: .minute)?.nanosecond, 0)
        
        XCTAssertEqual(now.beginning(of: .hour)?.minute, 0)
        XCTAssertEqual(now.beginning(of: .hour)?.second, 0)
        XCTAssertEqual(now.beginning(of: .hour)?.nanosecond, 0)
        
        XCTAssertEqual(now.beginning(of: .day)?.hour, 0)
        XCTAssertEqual(now.beginning(of: .day)?.minute, 0)
        XCTAssertEqual(now.beginning(of: .day)?.second, 0)
        XCTAssertEqual(now.beginning(of: .day)?.nanosecond, 0)
        XCTAssertEqual(now.beginning(of: .day)?.isToday, true)
        
        let calendar = Calendar.current
        let comps = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: now)
        let beginningOfWeek = calendar.date(from: comps)
        XCTAssertEqual(now.beginning(of: .weekOfMonth)?.day, beginningOfWeek?.day)
        XCTAssertEqual(now.beginning(of: .weekOfMonth)?.hour, 0)
        XCTAssertEqual(now.beginning(of: .weekOfMonth)?.minute, 0)
        XCTAssertEqual(now.beginning(of: .weekOfMonth)?.second, 0)
        XCTAssertEqual(now.beginning(of: .weekOfMonth)?.nanosecond, 0)

        XCTAssertEqual(now.beginning(of: .month)?.day, 1)
        XCTAssertEqual(now.beginning(of: .month)?.hour, 0)
        XCTAssertEqual(now.beginning(of: .month)?.minute, 0)
        XCTAssertEqual(now.beginning(of: .month)?.second, 0)
        XCTAssertEqual(now.beginning(of: .month)?.nanosecond, 0)
        
        XCTAssertEqual(now.beginning(of: .year)?.month, 1)
        XCTAssertEqual(now.beginning(of: .year)?.day, 1)
        XCTAssertEqual(now.beginning(of: .year)?.hour, 0)
        XCTAssertEqual(now.beginning(of: .year)?.minute, 0)
        XCTAssertEqual(now.beginning(of: .year)?.second, 0)
        XCTAssertEqual(now.beginning(of: .year)?.nanosecond, 0)
    }
    
    func testEnd() {
        let now = Date()
        let date = Date(year: 2018, month: 3, day: 4, hour: 5, minute: 6, second: 7)!

        XCTAssertEqual(now.end(of: .minute)?.second, 59)
        
        XCTAssertEqual(now.end(of: .hour)?.minute, 59)
        XCTAssertEqual(now.end(of: .hour)?.second, 59)
        
        XCTAssertEqual(now.end(of: .day)?.hour, 23)
        XCTAssertEqual(now.end(of: .day)?.minute, 59)
        XCTAssertEqual(now.end(of: .day)?.second, 59)
        XCTAssertEqual(now.end(of: .day)?.isToday, true)
        
        XCTAssertEqual(date.end(of: .month)?.month, 3)
        XCTAssertEqual(date.end(of: .month)?.day, 31)
        XCTAssertEqual(date.end(of: .month)?.hour, 23)
        XCTAssertEqual(date.end(of: .month)?.minute, 59)
        XCTAssertEqual(date.end(of: .month)?.second, 59)
        
        XCTAssertEqual(now.end(of: .year)?.month, 12)
        XCTAssertEqual(now.end(of: .year)?.day, 31)
        XCTAssertEqual(now.end(of: .year)?.hour, 23)
        XCTAssertEqual(now.end(of: .year)?.minute, 59)
        XCTAssertEqual(now.end(of: .year)?.second, 59)
        
        let calendar = Calendar.current
        let comps = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: now)
        let endOfWeek = calendar.date(from: comps)?.adding(.day, value: 7).adding(.second, value: -1)
        XCTAssertEqual(now.end(of: .weekOfYear), endOfWeek)
        XCTAssertEqual(now.end(of: .weekOfMonth), endOfWeek)
    }
    
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
