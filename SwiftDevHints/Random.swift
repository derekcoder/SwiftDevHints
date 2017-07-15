//
//  Random.swift
//  SwiftDevHints
//
//  Created by ZHOU DENGFENG on 14/7/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import Foundation

public func random(_ range: Range<Int>) -> Int {
    let count = UInt32(range.upperBound - range.lowerBound)
    return Int(arc4random_uniform(count)) + range.lowerBound
}
