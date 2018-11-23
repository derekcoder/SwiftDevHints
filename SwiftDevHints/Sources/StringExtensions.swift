//
//  StringExtensions.swift
//  SwiftDevHints
//
//  Created by ZHOU DENGFENG on 10/8/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import Foundation

extension String {
    /// The safe way to return string slice based on specified half-open range.
    ///
    ///     let string = "Hello, Swift!"
    ///     string[safe: 0..<5] // "Hello"
    ///     string[safe: 0..<14] // nil
    ///
    /// - Parameter range: The half-open range.
    public subscript(safe range: CountableRange<Int>) -> String? {
        guard let lowerIdx = index(startIndex, offsetBy: max(0, range.lowerBound), limitedBy: endIndex) else { return nil }
        guard let upperIdx = index(lowerIdx, offsetBy: range.upperBound - range.lowerBound, limitedBy: endIndex) else { return nil }
        return String(self[lowerIdx..<upperIdx])
    }
    
    /// The safe way to return string slice based on specified closed range.
    ///
    ///     let string = "Hello, Swift!"
    ///     string[safe: 0...4] // "Hello"
    ///     string[safe: 0...13] // nil
    ///
    /// - Parameter range: The closed range.
    public subscript(safe range: ClosedRange<Int>) -> String? {
        guard let lowerIdx = index(startIndex, offsetBy: max(0, range.lowerBound), limitedBy: endIndex) else { return nil }
        guard let upperIdx = index(lowerIdx, offsetBy: range.upperBound - range.lowerBound + 1, limitedBy: endIndex) else { return nil }
        return String(self[lowerIdx..<upperIdx])
    }
    
    /// Generate MD5
    ///
    ///     let string = "Swift".md5  // ae832e9b5bda2699db45f3fa6aa8c556
    ///
    public var md5: String {
        return StringProxy(proxy: self).md5
    }
    
    /// Return a string with first letter capitalized
    ///
    ///     let string = "hello world".capitalizingFirstLetter()
    ///     print(string)  // "Hello world"
    ///
    public func capitalizingFirstLetter() -> String {
        guard !isEmpty else { return "" }
        return prefix(1).uppercased() + dropFirst()
    }
    
    /// Capitalize the first letter
    ///
    ///     var string = "hello world"
    ///     string.capitalizeFirstLetter()
    ///     print(string)  // "Hello world"
    ///
    public mutating func capitalizeFirstLetter() {
        self = capitalizingFirstLetter()
    }
    
    /// Convert hex string to int
    ///
    ///     print("FF".intBaseHex)  // 255
    ///     print("Ff".intBaseHex)  // 255
    ///     print("fF".intBaseHex)  // 255
    ///     print("ff".intBaseHex)  // 255
    ///     print("0xff".intBaseHex)  // 255
    ///     print("fg".intBaseHex)  // nil
    ///
    public var intBaseHex: Int? {
        guard contains("0x") else {
            return Int(self, radix: 16)
        }
        return Int(dropFirst(2), radix: 16)
    }

    /// Return nil if string is empty
    ///
    ///     let string = "Swift".nilIfEmpty  // String?: "Swift"
    ///     let string = "".nilIfEmpty  // String?: nil
    ///
    public var nilIfEmpty: String? {
        guard !isEmpty else { return nil }
        return self
    }
}

extension Optional where Wrapped == String {
    /// The property will return nil if string is empty.
    ///
    ///     let fruit: String? = "Apple"
    ///     let empty: String? = ""
    ///     let string = fruit.nilIfEmpty  // String?: "Apple"
    ///     let string = empty.nilIfEmpty  // String?: nil
    ///
    public var nilIfEmpty: String? {
        guard let value = self else { return nil }
        return value.isEmpty ? nil : value
    }
}
