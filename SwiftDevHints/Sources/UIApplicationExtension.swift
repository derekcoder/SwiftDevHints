//
//  UIApplicationExtension.swift
//  SwiftDevHints
//
//  Created by Derek on 31/1/19.
//  Copyright © 2019 ZHOU DENGFENG DEREK. All rights reserved.
//

#if os(iOS)
import UIKit

public extension UIApplication {
    var isBackground: Bool {
        return !isForeground
    }
    
    var isForeground: Bool {
        return applicationState == .active
    }
}
#endif
