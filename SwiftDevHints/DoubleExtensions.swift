//
//  DoubleExtensions.swift
//  SwiftDevHints
//
//  Created by Julie on 1/8/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import Foundation

extension Double {
    public func format(_ f: String) -> String {
        return String(format: "%\(f)f", self)
    }
    
    public func roundTo(places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
