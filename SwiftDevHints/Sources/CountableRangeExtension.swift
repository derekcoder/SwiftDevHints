//
//  CountableRangeExtension.swift
//  SwiftDevHints
//
//  Created by ZHOU DENGFENG on 17/8/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import Foundation

extension CountableRange {
    /// The random Int Number in half-open range.
	///
    ///     let randomInt = (0..<10).randomInt
    ///     // randomInt is Int number between 0 ~ 10 (not include 10)
    ///
    public var randomInt: Int {
        let start = lowerBound as! Int
        let end = (upperBound as! Int) - 1
        let count = UInt32(end - start)
        return Int(arc4random_uniform(count)) + start
    }
}

