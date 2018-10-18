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
    public subscript(safe range: CountableRange<Int>) -> String? {
        guard let lowerIdx = index(startIndex, offsetBy: max(0, range.lowerBound), limitedBy: endIndex) else { return nil }
        guard let upperIdx = index(lowerIdx, offsetBy: range.upperBound - range.lowerBound, limitedBy: endIndex) else { return nil }
        return String(self[lowerIdx..<upperIdx])
    }
    
    public subscript(safe range: ClosedRange<Int>) -> String? {
        guard let lowerIdx = index(startIndex, offsetBy: max(0, range.lowerBound), limitedBy: endIndex) else { return nil }
        guard let upperIdx = index(lowerIdx, offsetBy: range.upperBound - range.lowerBound + 1, limitedBy: endIndex) else { return nil }
        return String(self[lowerIdx..<upperIdx])
    }
}
