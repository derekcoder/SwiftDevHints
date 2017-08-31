//
//  UIColorExtensions.swift
//  SwiftDevHints
//
//  Created by ZHOU DENGFENG on 18/8/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import UIKit

extension UIColor {
    public convenience init(redIn255: Int, greenIn255: Int, blueIn255: Int, alphaIn100: Int = 100) {
        self.init(red: CGFloat(redIn255)/255.0, green: CGFloat(greenIn255)/255.0, blue: CGFloat(blueIn255)/255.0, alpha: CGFloat(alphaIn100)/100.0)
    }
    
    public var intRGBA: (red: Int, green: Int, blue: Int, alpha: Int) {
        let comps = rgba
        return (Int(comps.red*255.0), Int(comps.green*255.0), Int(comps.blue*255.0), Int(comps.alpha*100.0))
    }
    
    public var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return (red, green, blue, alpha)
    }
}
