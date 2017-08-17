//
//  CountableRangeExtensions.swift
//  SwiftDevHints
//
//  Created by ZHOU DENGFENG on 17/8/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import Foundation

extension CountableRange {
    public var randomInt: Int {
        let start = lowerBound as! Int
        let end = (upperBound as! Int) - 1
        let count = UInt32(end - start)
        return Int(arc4random_uniform(count)) + start
    }
}

extension CountableClosedRange {
    public var randomInt: Int {
        let start = lowerBound as! Int
        let end = upperBound as! Int
        let count = UInt32(end - start)
        return Int(arc4random_uniform(count)) + start
    }
}
