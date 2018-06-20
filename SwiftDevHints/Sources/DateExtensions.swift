//
//  DateExtensions.swift
//  SwiftDevHints
//
//  Created by ZHOU DENGFENG on 17/12/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import Foundation

public extension Date {
    /// The start time of day for current date.
    ///
    ///     let today = Date() // December 17, 2017 at 5:54:46 PM GMT+8
    ///     let startOfToday = today.startOfDay // December 17, 2017 at 12:00:00 AM GMT+8
    ///
    public var startOfDay: Date {
        return NSCalendar.current.startOfDay(for: self)
    }
    
    /// The end time of day for current date.
    ///
    ///     let today = Date() // December 17, 2017 at 5:54:46 PM GMT+8
    ///     let endOfToday = today.endOfDay // December 17, 2017 at 11:59:59 PM GMT+8
    ///
    public var endOfDay: Date {
        return self.nextDay.startOfDay.addingTimeInterval(-1)
    }
    
    /// The next day for current date and the time is same.
    ///
    ///     let today = Date() // December 17, 2017 at 5:54:46 PM GMT+8
    ///     let startOfToday = today.startOfDay // December 18, 2017 at 5:54:46 PM GMT+8
    ///
    public var nextDay: Date {
        return NSCalendar.current.date(byAdding: .day, value: 1, to: self)!
    }
    
    /// The previous day for current date and the time is same.
    ///
    ///     let today = Date() // December 17, 2017 at 5:54:46 PM GMT+8
    ///     let startOfToday = today.startOfDay // December 16, 2017 at 5:54:46 PM GMT+8
    ///
    public var previousDay: Date {
        return NSCalendar.current.date(byAdding: .day, value: -1, to: self)!
    }
    
    /// The last days for current date and the time is same.
    ///
    ///     let today = Date() // December 17, 2017 at 5:54:46 PM GMT+8
    ///     // December 14, 2017 at 5:54:46 PM GMT+8
    ///     // December 15, 2017 at 5:54:46 PM GMT+8
    ///     // December 16, 2017 at 5:54:46 PM GMT+8
    ///     let last3Days = today.lastDays(withCount: 3, includingToday: false)
    ///
    public func lastDays(withCount count: Int, includingToday: Bool = true) -> [Date] {
        let calendar = NSCalendar.current
        
        var days = [Date]()
        
        let start = includingToday ? 0 : 1
        let end = includingToday ? count : count + 1
        for i in start..<end {
            let day = calendar.date(byAdding: .day, value: -i, to: self)!
            days.append(day)
        }
        
        return days.reversed()
    }
    
    /// The next days for current date and the time is same.
    ///
    ///     let today = Date() // December 17, 2017 at 5:54:46 PM GMT+8
    ///     // December 17, 2017 at 5:54:46 PM GMT+8
    ///     // December 18, 2017 at 5:54:46 PM GMT+8
    ///     // December 19, 2017 at 5:54:46 PM GMT+8
    ///     let next3Days = today.nextDays(withCount: 3, includingToday: true)
    ///
    public func nextDays(withCount count: Int, includingToday: Bool = true) -> [Date] {
        let calendar = NSCalendar.current
        
        var days = [Date]()
        
        let start = includingToday ? 0 : 1
        let end = includingToday ? count : count + 1
        for i in start..<end {
            let day = calendar.date(byAdding: .day, value: i, to: self)!
            days.append(day)
        }
        
        return days
    }
    
    public func isInSameYear(date: Date) -> Bool {
        return Calendar.current.isDate(self, equalTo: date, toGranularity: .year)
    }
    
    public func isInSameMonth(date: Date) -> Bool {
        return Calendar.current.isDate(self, equalTo: date, toGranularity: .month)
    }
    
    public func isInSameWeek(date: Date) -> Bool {
        return Calendar.current.isDate(self, equalTo: date, toGranularity: .weekOfYear)
    }
    
    public func isInSameDay(date: Date) -> Bool {
        return Calendar.current.isDate(self, inSameDayAs: date)
    }
    
    public var isToday: Bool {
        return Calendar.current.isDateInToday(self)
    }
    
    public var isTomorrow: Bool {
        return Calendar.current.isDateInTomorrow(self)
    }
    
    public var isYesterday: Bool {
        return Calendar.current.isDateInYesterday(self)
    }
    
    public var isWeekend: Bool {
        return Calendar.current.isDateInWeekend(self)
    }
    
    public var isWorkday: Bool {
        return !self.isWeekend
    }
    
    public var isThisWeek: Bool {
        return self.isInSameWeek(date: Date())
    }
    
    public var isThisMonth: Bool {
        return self.isInSameMonth(date: Date())
    }
    
    public var isThisYear: Bool {
        return self.isInSameYear(date: Date())
    }
    
    public var isFuture: Bool {
        return Date() < self
    }
    
    public var isPast: Bool {
        return self < Date()
    }
    
    public var era: Int {
        return Calendar.current.component(.era, from: self)
    }
    
    public var year: Int {
        get { return Calendar.current.component(.year, from: self) }
        set {
            guard newValue > 0 else { return }
            let calendar = Calendar.current
            let currentYear = calendar.component(.year, from: self)
            guard let newDate = calendar.date(byAdding: .year, value: newValue - currentYear, to: self) else { return }
            self = newDate
        }
    }
    
    public var weekOfYear: Int {
        return Calendar.current.component(.weekOfYear, from: self)
    }
    
    public var month: Int {
        get { return Calendar.current.component(.month, from: self) }
        set {
            let calendar = Calendar.current
            guard let rangeOfMonths = calendar.range(of: .month, in: .year, for: self) else { return }
            guard rangeOfMonths.contains(newValue) else { return }
            
            let currentMonth = calendar.component(.month, from: self)
            guard let newDate = calendar.date(byAdding: .month, value: newValue - currentMonth, to: self) else { return }
            self = newDate
        }
    }
    
    public var weekday: Int {
        return Calendar.current.component(.weekday, from: self)
    }

    public var weekOfMonth: Int {
        return Calendar.current.component(.weekOfMonth, from: self)
    }
    
    public var day: Int {
        get { return Calendar.current.component(.day, from: self) }
        set {
            let calendar = Calendar.current
            guard let rangeOfDays = calendar.range(of: .day, in: .month, for: self) else { return }
            guard rangeOfDays.contains(newValue) else { return }
            
            let currentDay = calendar.component(.day, from: self)
            guard let newDate = calendar.date(byAdding: .day, value: newValue - currentDay, to: self) else { return }
            self = newDate
        }
    }
    
    public var hour: Int {
        get { return Calendar.current.component(.hour, from: self) }
        set {
            let calendar = Calendar.current
            guard let rangeOfHours = calendar.range(of: .hour, in: .day, for: self) else { return }
            guard rangeOfHours.contains(newValue) else { return }
            
            let currentHour = calendar.component(.hour, from: self)
            guard let newDate = calendar.date(byAdding: .hour, value: newValue - currentHour, to: self) else { return }
            self = newDate
        }
    }
    
    public var minute: Int {
        get { return Calendar.current.component(.minute, from: self) }
        set {
            let calendar = Calendar.current
            guard let rangeOfMinutes = calendar.range(of: .minute, in: .hour, for: self) else { return }
            guard rangeOfMinutes.contains(newValue) else { return }
            
            let currentMinute = calendar.component(.minute, from: self)
            guard let newDate = calendar.date(byAdding: .minute, value: newValue - currentMinute, to: self) else { return }
            self = newDate
        }
    }
    
    public var second: Int {
        get { return Calendar.current.component(.second, from: self) }
        set {
            let calendar = Calendar.current
            guard let rangeOfSeconds = calendar.range(of: .second, in: .minute, for: self) else { return }
            guard rangeOfSeconds.contains(newValue) else { return }
            
            let currentSecond = calendar.component(.second, from: self)
            guard let newDate = calendar.date(byAdding: .second, value: newValue - currentSecond, to: self) else { return }
            self = newDate
        }
    }
    
    public var nanosecond: Int {
        get { return Calendar.current.component(.nanosecond, from: self) }
        set {
            let calendar = Calendar.current
            guard let rangeOfNanoseconds = calendar.range(of: .nanosecond, in: .second, for: self) else { return }
            guard rangeOfNanoseconds.contains(newValue) else { return }
            
            let currentNanosecond = calendar.component(.nanosecond, from: self)
            guard let newDate = calendar.date(byAdding: .second, value: newValue - currentNanosecond, to: self) else { return }
            self = newDate
        }
    }
}

