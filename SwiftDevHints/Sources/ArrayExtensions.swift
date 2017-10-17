//
//  ArrayExtensions.swift
//  SwiftDevHints
//
//  Created by Julie on 17/10/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import Foundation

extension Array {
    public func accumulate<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Element) throws -> Result) rethrows -> [Result] {
        var accumulator = initialResult
        return try map { next in
            accumulator = try nextPartialResult(accumulator, next)
            return accumulator
        }
    }
}
