//
//  UIColorExtensions.swift
//  SwiftDevHints
//
//  Created by ZHOU DENGFENG on 18/8/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

#if os(macOS)
import Cocoa

public extension NSColor {
  static var random: NSColor {
    let red = (0...255).randomElement()!
    let green = (0...255).randomElement()!
    let blue = (0...255).randomElement()!
    
    return NSColor(red: red, green: green, blue: blue)
  }
  
  /// Return components of hue, saturation, brightness, and alpha
  var hsbaComponents: (hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) {
    var h: CGFloat = 0.0
    var s: CGFloat = 0.0
    var b: CGFloat = 0.0
    var a: CGFloat = 0.0
    getHue(&h, saturation: &s, brightness: &b, alpha: &a)
    return (hue: h, saturation: s, brightness: b, alpha: a)
  }
  
  /// Return RGBA components with CGFloat type (betweem 0.0 and 1.0)
  var rgbaComponents: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
    var r: CGFloat = 0
    var g: CGFloat = 0
    var b: CGFloat = 0
    var a: CGFloat = 0
    getRed(&r, green: &g, blue: &b, alpha: &a)
    return (red: r, green: g, blue: b, alpha: a)
  }
  
  /// Return RGB components with Int type (bewteen 0 and 255)
  var rgbComponents: (red: Int, green: Int, blue: Int) {
    let comps = rgbaComponents
    return (red: Int(comps.red * 255.0), green: Int(comps.green * 255.0), blue: Int(comps.blue * 255.0))
  }

  var hexString: String {
    let components: [Int] = {
      let c = cgColor.components!
      let components = c.count == 4 ? c : [c[0], c[0], c[0], c[1]]
      return components.map { Int($0 * 255.0) }
    }()
    return String(format: "#%02X%02X%02X", components[0], components[1], components[2])
  }
}

public extension NSColor {
  /// Create an NSColor object with RGB components and transparency.
  /// - Parameters:
  ///   - red: red component (between 0 and 255)
  ///   - green: green component (between 0 and 255)
  ///   - blue: blue component (between 0 and 255)
  ///   - transparency: opacity value of the color object (between 0.0 and 1.0)
  convenience init(red: Int, green: Int, blue: Int, transparency: CGFloat = 1) {
    assert(red >= 0 && red <= 255, "Invalid red")
    assert(green >= 0 && green <= 255, "Invalid green")
    assert(blue >= 0 && blue <= 255, "Invalid blue")
    var alpha: CGFloat {
      if transparency > 1 {
        return 1
      } else if transparency < 0 {
        return 0
      } else {
        return transparency
      }
    }
    self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
  }
  
  /// Create an NSColor object with hexadecimal string.
  /// - Parameters:
  ///   - hexString: hexadecimal string ("#35AF46", "25B767")
  ///   - alpha: opacity value of the color object
  convenience init(hexString: String, alpha: CGFloat = 1) {
    let string = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    let scanner = Scanner(string: string)
    
    if string.hasPrefix("#") {
      if #available(macOS 10.15, *) {
        scanner.currentIndex = string.index(after: string.startIndex)
      } else {
        scanner.scanLocation = 1
      }
    }
    var color: UInt64 = 0
    scanner.scanHexInt64(&color)
    
    let mask = 0x000000FF
    let r = Int(color >> 16) & mask
    let g = Int(color >> 8) & mask
    let b = Int(color) & mask
    
    let red   = CGFloat(r) / 255.0
    let green = CGFloat(g) / 255.0
    let blue  = CGFloat(b) / 255.0
    
    self.init(red: red, green: green, blue: blue, alpha: alpha)
  }
  
  /// Create a black or white NSColor object that constrasts to specified color.
  /// - Parameter backgroundColor: specified color
  convenience init(constrastingBlackOrWhiteColorOn backgroundColor: NSColor) {
    let rgba = backgroundColor.rgbaComponents
    
    if rgba.alpha == 0 {
      self.init(white: 0, alpha: 1)
      return
    }
    
    let red = rgba.red * 0.2126
    let green = rgba.green * 0.7152
    let blue = rgba.blue * 0.0722
    let luminance = red + green + blue
    
    if luminance > 0.6 {
      self.init(red: 0, green: 0, blue: 0, alpha: 1)
    } else {
      self.init(red: 1, green: 1, blue: 1, alpha: 1)
    }
  }

}

#else
import UIKit

public extension UIColor {
  
  /// Return a random color
  static var random: UIColor {
    let red = (0...255).randomElement()!
    let green = (0...255).randomElement()!
    let blue = (0...255).randomElement()!
    
    return UIColor(red: red, green: green, blue: blue)
  }
  
  /// Return components of hue, saturation, brightness, and alpha
  var hsbaComponents: (hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) {
    var h: CGFloat = 0.0
    var s: CGFloat = 0.0
    var b: CGFloat = 0.0
    var a: CGFloat = 0.0
    getHue(&h, saturation: &s, brightness: &b, alpha: &a)
    return (hue: h, saturation: s, brightness: b, alpha: a)
  }
  
  /// Return RGBA components with CGFloat type (betweem 0.0 and 1.0)
  var rgbaComponents: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
    var r: CGFloat = 0
    var g: CGFloat = 0
    var b: CGFloat = 0
    var a: CGFloat = 0
    getRed(&r, green: &g, blue: &b, alpha: &a)
    return (red: r, green: g, blue: b, alpha: a)
  }
  
  /// Return RGB components with Int type (bewteen 0 and 255)
  var rgbComponents: (red: Int, green: Int, blue: Int) {
    let comps = rgbaComponents
    return (red: Int(comps.red * 255.0), green: Int(comps.green * 255.0), blue: Int(comps.blue * 255.0))
  }
  
  /// Return hexadecimal value string of this color (start with "#")
  var hexString: String {
    let components: [Int] = {
      let c = cgColor.components!
      let components = c.count == 4 ? c : [c[0], c[0], c[0], c[1]]
      return components.map { Int($0 * 255.0) }
    }()
    return String(format: "#%02X%02X%02X", components[0], components[1], components[2])
  }
}

// MARK: - Initializers

public extension UIColor {
  /// Create an UIColor object with RGB components and transparency.
  /// - Parameters:
  ///   - red: red component (between 0 and 255)
  ///   - green: green component (between 0 and 255)
  ///   - blue: blue component (between 0 and 255)
  ///   - transparency: opacity value of the color object (between 0.0 and 1.0)
  convenience init(red: Int, green: Int, blue: Int, transparency: CGFloat = 1) {
    assert(red >= 0 && red <= 255, "Invalid red")
    assert(green >= 0 && green <= 255, "Invalid green")
    assert(blue >= 0 && blue <= 255, "Invalid blue")
    var alpha: CGFloat {
      if transparency > 1 {
        return 1
      } else if transparency < 0 {
        return 0
      } else {
        return transparency
      }
    }
    self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
  }
  
  /// Create an UIColor object with hexadecimal string.
  /// - Parameters:
  ///   - hexString: hexadecimal string ("#35AF46", "25B767")
  ///   - alpha: opacity value of the color object
  convenience init(hexString: String, alpha: CGFloat = 1) {
    let string = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    let scanner = Scanner(string: string)
    
    if string.hasPrefix("#") {
      if #available(iOS 13.0, *) {
        if #available(watchOSApplicationExtension 6.0, *) {
          scanner.currentIndex = string.index(after: string.startIndex)
        } else {
          scanner.scanLocation = 1
        }
      } else {
        scanner.scanLocation = 1
      }
    }
    var color: UInt64 = 0
    scanner.scanHexInt64(&color)
    
    let mask = 0x000000FF
    let r = Int(color >> 16) & mask
    let g = Int(color >> 8) & mask
    let b = Int(color) & mask
    
    let red   = CGFloat(r) / 255.0
    let green = CGFloat(g) / 255.0
    let blue  = CGFloat(b) / 255.0
    
    self.init(red: red, green: green, blue: blue, alpha: alpha)
  }
  
  /// Create a black or white UIColor object that constrasts to specified color.
  /// - Parameter backgroundColor: specified color
  convenience init(constrastingBlackOrWhiteColorOn backgroundColor: UIColor) {
    let rgba = backgroundColor.rgbaComponents
    
    if rgba.alpha == 0 {
      self.init(white: 0, alpha: 1)
      return
    }
    
    let red = rgba.red * 0.2126
    let green = rgba.green * 0.7152
    let blue = rgba.blue * 0.0722
    let luminance = red + green + blue
    
    if luminance > 0.6 {
      self.init(red: 0, green: 0, blue: 0, alpha: 1)
    } else {
      self.init(red: 1, green: 1, blue: 1, alpha: 1)
    }
  }
}
#endif
