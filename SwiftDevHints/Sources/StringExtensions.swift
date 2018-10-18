//
//  StringExtensions.swift
//  SwiftDevHints
//
//  Created by ZHOU DENGFENG on 10/8/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import Foundation

public extension String {
    public var md5: String {
        return StringProxy(proxy: self).md5
    }
    
    public func capitalizingFirstLetter() -> String {
        guard !isEmpty else { return "" }
        return prefix(1).uppercased() + dropFirst()
    }
    
    public mutating func capitalizeFirstLetter() {
        self = capitalizingFirstLetter()
    }
}

extension String {
    public func localized(comment: String = "") -> String {
        return NSLocalizedString(self, comment: comment)
    }
}

extension String {
    public var hexInt: Int? {
        let scanner = Scanner(string: self)
        var value: UInt64 = 0
        guard scanner.scanHexInt64(&value) else { return nil }
        return Int(value)
    }
}

extension String {
    public var nilIfEmpty: String? {
        guard !isEmpty else { return nil }
        return self
    }
}

extension Substring {
    public var hexInt: Int? {
        let str = String(self)
        return str.hexInt
    }
}

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
}
