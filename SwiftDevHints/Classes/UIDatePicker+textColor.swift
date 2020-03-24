//
//  UIDatePicker+textColor.swift
//  SwiftDevHints
//
//  Created by derekcoder on 24/3/20.
//  Copyright © 2020 ZHOU DENGFENG DEREK. All rights reserved.
//

#if os(iOS)

import UIKit

public extension UIDatePicker {
  var textColor: UIColor? {
    get {
      value(forKeyPath: "textColor") as? UIColor
    }
    set {
      setValue(newValue, forKeyPath: "textColor")
      setValue(false, forKeyPath: "highlightsToday")
    }
  }
}

#endif

