//
//  IntExtensions.swift
//  SwiftDevHints
//
//  Created by ZHOU DENGFENG on 17/7/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import Foundation

extension Int {
    /// Return a formated string of the value.
    ///
    ///     let positiveInt = 8
    ///     let aString1 = positiveInt.format("03") // "008"
    ///     let aString2 = positiveInt.format("3")  // "  8"
    ///
    ///     let negativeInt = -8
    ///     let aString3 = negativeInt.format("03") // "-08"
    ///     let aString4 = negativeInt.format("3")  // " -8"
    ///
    /// - Parameter f: Format string
    /// - Returns: Formated string
    public func format(_ f: String) -> String {
        return String(format: "%\(f)ld", self)
    }
}

extension Int8 {
    /// Return a formated string of the value.
    ///
    ///     let positiveInt: Int8 = 8
    ///     let aString1 = positiveInt.format("03") // "008"
    ///     let aString2 = positiveInt.format("3")  // "  8"
    ///
    ///     let negativeInt: Int8 = -8
    ///     let aString3 = negativeInt.format("03") // "-08"
    ///     let aString4 = negativeInt.format("3")  // " -8"
    ///
    /// - Parameter f: Format string
    /// - Returns: Formated string
    public func format(_ f: String) -> String {
        return String(format: "%\(f)d", self)
    }
}

extension Int16 {
    /// Return a formated string of the value.
    ///
    ///     let positiveInt: Int16 = 8
    ///     let aString1 = positiveInt.format("03") // "008"
    ///     let aString2 = positiveInt.format("3")  // "  8"
    ///
    ///     let negativeInt: Int16 = -8
    ///     let aString3 = negativeInt.format("03") // "-08"
    ///     let aString4 = negativeInt.format("3")  // " -8"
    ///
    /// - Parameter f: Format string
    /// - Returns: Formated string
    public func format(_ f: String) -> String {
        return String(format: "%\(f)d", self)
    }
}

extension Int32 {
    /// Return a formated string of the value.
    ///
    ///     let positiveInt: Int32 = 8
    ///     let aString1 = positiveInt.format("03") // "008"
    ///     let aString2 = positiveInt.format("3")  // "  8"
    ///
    ///     let negativeInt: Int32 = -8
    ///     let aString3 = negativeInt.format("03") // "-08"
    ///     let aString4 = negativeInt.format("3")  // " -8"
    ///
    /// - Parameter f: Format string
    /// - Returns: Formated string
    public func format(_ f: String) -> String {
        return String(format: "%\(f)d", self)
    }
}

extension Int64 {
    /// Return a formated string of the value.
    ///
    ///     let positiveInt: Int64 = 8
    ///     let aString1 = positiveInt.format("03") // "008"
    ///     let aString2 = positiveInt.format("3")  // "  8"
    ///
    ///     let negativeInt: Int64 = -8
    ///     let aString3 = negativeInt.format("03") // "-08"
    ///     let aString4 = negativeInt.format("3")  // " -8"
    ///
    /// - Parameter f: Format string
    /// - Returns: Formated string
    public func format(_ f: String) -> String {
        return String(format: "%\(f)ld", self)
    }
}

extension UInt {
    /// Return a formated string of the value.
    ///
    ///     let positiveInt: UInt = 8
    ///     let aString1 = positiveInt.format("03") // "008"
    ///     let aString2 = positiveInt.format("3")  // "  8"
    ///
    /// - Parameter f: Format string
    /// - Returns: Formated string
    public func format(_ f: String) -> String {
        return String(format: "%\(f)lu", self)
    }
}

extension UInt8 {
    /// Return a formated string of the value.
    ///
    ///     let positiveInt: UInt8 = 8
    ///     let aString1 = positiveInt.format("03") // "008"
    ///     let aString2 = positiveInt.format("3")  // "  8"
    ///
    /// - Parameter f: Format string
    /// - Returns: Formated string
    public func format(_ f: String) -> String {
        return String(format: "%\(f)u", self)
    }
}

extension UInt16 {
    /// Return a formated string of the value.
    ///
    ///     let positiveInt: UInt16 = 8
    ///     let aString1 = positiveInt.format("03") // "008"
    ///     let aString2 = positiveInt.format("3")  // "  8"
    ///
    /// - Parameter f: Format string
    /// - Returns: Formated string
    public func format(_ f: String) -> String {
        return String(format: "%\(f)u", self)
    }
}

extension UInt32 {
    /// Return a formated string of the value.
    ///
    ///     let positiveInt: UInt32 = 8
    ///     let aString1 = positiveInt.format("03") // "008"
    ///     let aString2 = positiveInt.format("3")  // "  8"
    ///
    /// - Parameter f: Format string
    /// - Returns: Formated string
    public func format(_ f: String) -> String {
        return String(format: "%\(f)u", self)
    }
}

extension UInt64 {
    /// Return a formated string of the value.
    ///
    ///     let positiveInt: UInt64 = 8
    ///     let aString1 = positiveInt.format("03") // "008"
    ///     let aString2 = positiveInt.format("3")  // "  8"
    ///
    /// - Parameter f: Format string
    /// - Returns: Formated string
    public func format(_ f: String) -> String {
        return String(format: "%\(f)u", self)
    }
}

extension Int {
    public var hexString: String {
        return String(self, radix: 16, uppercase: true)
    }
}



