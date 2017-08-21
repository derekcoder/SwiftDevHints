//
//  DoubleExtensions.swift
//  SwiftDevHints
//
//  Created by ZHOU DENGFENG on 1/8/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import Foundation

extension Double {
    /// Return a formated string of the value.
    ///
    ///     let positiveDouble = 3.14159265
    ///     let aString1 = positiveDouble.format(".2")  // "3.14"
    ///     let aString2 = positiveDouble.format(".3")  // "3.142"
    ///
    ///     let negativeDouble = -3.14159265
    ///     let aString3 = negativeDouble.format(".2")  // "-3.14"
    ///     let aString4 = negativeDouble.format(".3")  // "-3.142"
    ///
    /// - Parameter f: Format string
    /// - Returns: Formated string
    public func format(_ f: String) -> String {
        return String(format: "%\(f)f", self)
    }
    
    
    /// Return a rounded Double value according to places.
    ///
    ///     let aDouble = 3.14159265
    ///     let roundedDouble1 = aDouble.roundTo(places: 2) // 3.14
    ///     let roundedDouble2 = aDouble.roundTo(places: 3) // 3.142
    ///
    /// - Parameter places: Decimal places for rounding
    /// - Returns: Rounded Double value
    public func roundTo(places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
