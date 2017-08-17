//
//  StringExtensions.swift
//  SwiftDevHints
//
//  Created by Julie on 10/8/17.
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
