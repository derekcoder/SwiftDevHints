//
//  FloatExtensions.swift
//  SwiftDevHints
//
//  Created by ZHOU DENGFENG on 15/9/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import Foundation

extension Float {
    /// Return a rounded Float value according to places.
    ///
    ///     let aFloat: Float = 3.14159265
    ///     let roundedFloat1 = aFloat.roundTo(places: 2) // 3.14
    ///     let roundedFloat2 = aFloat.roundTo(places: 3) // 3.142
    ///
    /// - Parameter places: Decimal places for rounding
    /// - Returns: Rounded Float value
    public func roundTo(places: Int) -> Float {
        let divisor = pow(Float(10.0), Float(places))
        return (self * divisor).rounded() / divisor
    }
}

public extension Float {
    var int: Int {
        return Int(self)
    }
    
    var int32: Int32 {
        return Int32(self)
    }
    
    var double: Double {
        return Double(self)
    }

    var cgFloat: CGFloat {
        return CGFloat(self)
    }
    
    var string: String {
        return "\(self)"
    }
}

public extension CGFloat {
    var int: Int {
        return Int(self)
    }
    
    var int32: Int32 {
        return Int32(self)
    }
    
    var double: Double {
        return Double(self)
    }
    
    var float: Float {
        return Float(self)
    }
    
    var string: String {
        return "\(self)"
    }
}


