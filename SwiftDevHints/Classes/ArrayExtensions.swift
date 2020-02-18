//
//  ArrayExtensions.swift
//  SwiftDevHints
//
//  Created by Derek on 17/10/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import Foundation

public extension Array {
    func accumulate<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Element) throws -> Result) rethrows -> [Result] {
        var accumulator = initialResult
        return try map { next in
            accumulator = try nextPartialResult(accumulator, next)
            return accumulator
        }
    }
    
    func index(of e: Element, condition: (Element, Element) throws -> (Bool)) rethrows -> Int? {
        for (idx, item) in self.enumerated() {
            if try condition(item, e) {
                return idx
            }
        }
        return nil
    }
}
