//
//  CountableRangeExtension.swift
//  SwiftDevHints
//
//  Created by ZHOU DENGFENG on 17/8/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import Foundation

extension CountableRange where Bound == Int {
    /// The random Int Number in half-open range.
	///
    ///     let randomInt = (0..<10).randomInt
    ///     // randomInt is Int number between 0 ~ 10 (not include 10)
    ///
    public var randomInt: Int {
        let start = lowerBound
        let end = upperBound
        let length = end - start
        return Int(arc4random_uniform(UInt32(length))) + start
    }
}

