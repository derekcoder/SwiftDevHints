//
//  IntExtensions.swift
//  SwiftDevHints
//
//  Created by ZHOU DENGFENG on 17/7/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import Foundation

extension Int {
    public func format(_ f: String) -> String {
        return String(format: "%\(f)d", self)
    }
}
