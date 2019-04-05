//
//  DateExtensions.swift
//  SwiftDevHints
//
//  Created by ZHOU DENGFENG on 17/12/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import Foundation

public extension Date {
    func next(of component: Calendar.Component) -> Date? {
        let calendar = Calendar.current
        switch component {
        case .year, .month, .day, .hour, .minute, .second:
            return calendar.date(byAdding: component, value: 1, to: self)
        case .weekOfYear, .weekOfMonth:
            return calendar.date(byAdding: .day, value: 7, to: self)
        default: return nil
        }
    }
    
    func previous(of component: Calendar.Component) -> Date? {
        let calendar = Calendar.current
        switch component {
        case .year, .month, .day, .hour, .minute, .second:
            return calendar.date(byAdding: component, value: -1, to: self)
        case .weekOfYear, .weekOfMonth:
            return calendar.date(byAdding: .day, value: -7, to: self)
        default: return nil
        }
    }

    func beginning(of component: Calendar.Component) -> Date? {
        let components: Set<Calendar.Component>
        switch component {
        case .year: components = [.year]
        case .month: components = [.year, .month]
        case .day: components = [.year, .month, .day]
        case .weekOfYear, .weekOfMonth: components = [.yearForWeekOfYear, .weekOfYear]
        case .hour: components = [.year, .month, .day, .hour]
        case .minute: components = [.year, .month, .day, .hour, .minute]
        case .second: components = [.year, .month, .day, .hour, .minute, .second]
        default: components = []
        }
        
        guard !components.isEmpty else { return nil }
        return Calendar.current.date(from: Calendar.current.dateComponents(components, from: self))
    }
    
    func end(of component: Calendar.Component) -> Date? {
        switch component {
        case .year, .month, .day, .weekOfYear, .weekOfMonth, .hour, .minute, .second:
            let beginningOfNext = self.next(of: component)!.beginning(of: component)!
            return beginningOfNext.previous(of: .second)
        default: return nil
        }
    }
    
    /// The start time of day for current date.
    ///
    ///     let today = Date() // December 17, 2017 at 5:54:46 PM GMT+8
    ///     let startOfToday = today.startOfDay // December 17, 2017 at 12:00:00 AM GMT+8
    ///
    var startOfDay: Date {
        return NSCalendar.current.startOfDay(for: self)
    }
    
    /// The end time of day for current date.
    ///
    ///     let today = Date() // December 17, 2017 at 5:54:46 PM GMT+8
    ///     let endOfToday = today.endOfDay // December 17, 2017 at 11:59:59 PM GMT+8
    ///
    var endOfDay: Date {
        return self.nextDay.startOfDay.addingTimeInterval(-1)
    }
    
    /// The next day for current date and the time is same.
    ///
    ///     let today = Date() // December 17, 2017 at 5:54:46 PM GMT+8
    ///     let startOfToday = today.startOfDay // December 18, 2017 at 5:54:46 PM GMT+8
    ///
    var nextDay: Date {
        return NSCalendar.current.date(byAdding: .day, value: 1, to: self)!
    }
    
    /// The previous day for current date and the time is same.
    ///
    ///     let today = Date() // December 17, 2017 at 5:54:46 PM GMT+8
    ///     let startOfToday = today.startOfDay // December 16, 2017 at 5:54:46 PM GMT+8
    ///
    var previousDay: Date {
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
    func lastDays(withCount count: Int, includingToday: Bool = true) -> [Date] {
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
    func nextDays(withCount count: Int, includingToday: Bool = true) -> [Date] {
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
    
    func adding(_ comp: Calendar.Component, value: Int) -> Date {
        return Calendar.current.date(byAdding: comp, value: value, to: self)!
    }
    
    mutating func add(_ comp: Calendar.Component, value: Int) {
        self = adding(comp, value: value)
    }
    
    func isInSameYear(date: Date) -> Bool {
        return Calendar.current.isDate(self, equalTo: date, toGranularity: .year)
    }
    
    func isInSameMonth(date: Date) -> Bool {
        return Calendar.current.isDate(self, equalTo: date, toGranularity: .month)
    }
    
    func isInSameWeek(date: Date) -> Bool {
        return Calendar.current.isDate(self, equalTo: date, toGranularity: .weekOfYear)
    }
    
    func isInSameDay(date: Date) -> Bool {
        return Calendar.current.isDate(self, inSameDayAs: date)
    }
    
    var isToday: Bool {
        return Calendar.current.isDateInToday(self)
    }
    
    var isTomorrow: Bool {
        return Calendar.current.isDateInTomorrow(self)
    }
    
    var isYesterday: Bool {
        return Calendar.current.isDateInYesterday(self)
    }
    
    var isWeekend: Bool {
        return Calendar.current.isDateInWeekend(self)
    }
    
    var isWorkday: Bool {
        return !self.isWeekend
    }
    
    var isThisWeek: Bool {
        return self.isInSameWeek(date: Date())
    }
    
    var isThisMonth: Bool {
        return self.isInSameMonth(date: Date())
    }
    
    var isThisYear: Bool {
        return self.isInSameYear(date: Date())
    }
    
    var isFuture: Bool {
        return Date() < self
    }
    
    var isPast: Bool {
        return self < Date()
    }
    
    var era: Int {
        return Calendar.current.component(.era, from: self)
    }
    
    var year: Int {
        get { return Calendar.current.component(.year, from: self) }
        set {
            guard newValue > 0 else { return }
            let calendar = Calendar.current
            let currentYear = calendar.component(.year, from: self)
            guard let newDate = calendar.date(byAdding: .year, value: newValue - currentYear, to: self) else { return }
            self = newDate
        }
    }
    
    var weekOfYear: Int {
        return Calendar.current.component(.weekOfYear, from: self)
    }
    
    var month: Int {
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
    
    var weekday: Int {
        return Calendar.current.component(.weekday, from: self)
    }

    var weekOfMonth: Int {
        return Calendar.current.component(.weekOfMonth, from: self)
    }
    
    var day: Int {
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
    
    var hour: Int {
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
    
    var minute: Int {
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
    
    var second: Int {
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
    
    var nanosecond: Int {
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
    
    init?(calendar: Calendar? = Calendar.current,
          timeZone: TimeZone = TimeZone.current,
          era: Int? = Date().era,
          year: Int? = Date().year,
          month: Int? = Date().month,
          day: Int? = Date().day,
          hour: Int? = Date().hour,
          minute: Int? = Date().minute,
          second: Int? = Date().second,
          nanosecond: Int? = Date().nanosecond) {
        var comps = DateComponents()
        comps.calendar = calendar
        comps.timeZone = timeZone
        comps.era = era
        comps.year = year
        comps.month = month
        comps.day = day
        comps.hour = hour
        comps.minute = minute
        comps.second = second
        comps.nanosecond = nanosecond
        
        guard let date = calendar?.date(from: comps) else { return nil }
        self = date
    }
}

