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
    
    public convenience init?(hex: String) {
        var str = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if str.hasPrefix("#") {
            let indexOffsetBy1 = str.index(str.startIndex, offsetBy: 1)
            str = String(str[indexOffsetBy1...])
        }
        
        guard str.count == 6 else { return nil }
        
        let startIndex = str.startIndex
        let endIndex = str.endIndex

        let indexOffsetBy2 = str.index(startIndex, offsetBy: 2)
        let indexOffsetBy4 = str.index(startIndex, offsetBy: 4)
        
        let red = str[startIndex..<indexOffsetBy2]
        let green = str[indexOffsetBy2..<indexOffsetBy4]
        let blue = str[indexOffsetBy4..<endIndex]
        
        guard let redIn255 = red.hexInt else { return nil }
        guard let greenIn255 = green.hexInt else { return nil }
        guard let blueIn255 = blue.hexInt else { return nil }
        
        self.init(redIn255: redIn255, greenIn255: greenIn255, blueIn255: blueIn255)
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
    
    public func rgbHexString(prefix: String = "") -> String {
        let intRGBA = self.intRGBA
        return "\(prefix)\(intRGBA.red.hexString)\(intRGBA.green.hexString)\(intRGBA.blue.hexString)"
    }
}
