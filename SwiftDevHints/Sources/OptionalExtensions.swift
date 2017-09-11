//
//  OptionalExtensions.swift
//  SwiftDevHints
//
//  Created by Julie on 11/9/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import Foundation

extension Optional where Wrapped == String {
    public var nilIfEmpty: String? {
        guard let unwrappedValue = self else { return nil }
        return unwrappedValue.isEmpty ? nil : unwrappedValue
    }
}
