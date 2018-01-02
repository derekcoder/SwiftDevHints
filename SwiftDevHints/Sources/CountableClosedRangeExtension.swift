//
//  CountableClosedRangeExtension.swift
//  SwiftDevHints
//
//  Created by Derek on 2/1/18.
//  Copyright © 2018 ZHOU DENGFENG DEREK. All rights reserved.
//

import Foundation

extension CountableClosedRange where Bound == Int {
    /// The random Int Number in closed range.
    ///
    ///     let randomInt = (0...10).randomInt
    ///     // randomInt is Int number between 0 ~ 10 (include 10)
    ///
    public var randomInt: Int {
        let start = lowerBound
        let end = upperBound
        let length = end - start + 1
        return Int(arc4random_uniform(UInt32(length))) + start
    }
}
