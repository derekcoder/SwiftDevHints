//
//  StringExtensions.swift
//  SwiftDevHints
//
//  Created by ZHOU DENGFENG on 10/8/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import Foundation

extension String {
    public var md5: String {
        return StringProxy(proxy: self).md5
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

extension Substring {
    public var hexInt: Int? {
        let str = String(self)
        return str.hexInt
    }
}
