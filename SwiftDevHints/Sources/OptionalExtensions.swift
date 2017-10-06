//
//  OptionalExtensions.swift
//  SwiftDevHints
//
//  Created by ZHOU DENGFENG on 11/9/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import Foundation

extension Optional where Wrapped == String {
    public var nilIfEmpty: String? {
        guard let value = self else { return nil }
        return value.isEmpty ? nil : value
    }
}

