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
    
    /// The start time of next day for current date.
    ///
    ///     let today = Date() // December 17, 2017 at 5:54:46 PM GMT+8
    ///     let startOfToday = today.startOfDay // December 18, 2017 at 12:00:00 AM GMT+8
    ///
    public var nextDay: Date {
        return NSCalendar.current.date(byAdding: .day, value: 1, to: self)!.startOfDay
    }
    
    /// The start time of previous day for current date.
    ///
    ///     let today = Date() // December 17, 2017 at 5:54:46 PM GMT+8
    ///     let startOfToday = today.startOfDay // December 16, 2017 at 12:00:00 AM GMT+8
    ///
    public var previousDay: Date {
        return NSCalendar.current.date(byAdding: .day, value: -1, to: self)!.startOfDay
    }
    
    /// The start time of previous day for current date.
    ///
    ///     let today = Date() // December 17, 2017 at 5:54:46 PM GMT+8
    ///     let startOfToday = today.startOfDay // December 16, 2017 at 12:00:00 AM GMT+8
    ///
    public func lastDays(withCount count: Int, includingToday: Bool = true) -> [Date] {
        let calendar = NSCalendar.current
        
        var days = [Date]()
        
        let start = includingToday ? 0 : 1
        let end = includingToday ? count : count + 1
        for i in start..<end {
            let day = calendar.date(byAdding: .day, value: -i, to: self)!.startOfDay
            days.append(day)
        }
        
        return days.reversed()
    }
    
    public func nextDays(withCount count: Int, includingToday: Bool = true) -> [Date] {
        let calendar = NSCalendar.current
        
        var days = [Date]()
        
        let start = includingToday ? 0 : 1
        let end = includingToday ? count : count + 1
        for i in start..<end {
            let day = calendar.date(byAdding: .day, value: i, to: self)!.startOfDay
            days.append(day)
        }
        
        return days
    }
}

