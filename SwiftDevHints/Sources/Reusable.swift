//
//  UITableViewCellExtensions.swift
//  SwiftDevHints
//
//  Created by ZHOU DENGFENG on 15/7/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import UIKit

// Reference from https://github.com/andyyhope/nemo

public protocol Reusable: class {
    static var reuseIdentifier: String { get }
}

public extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

public typealias NibReusable = NibLoadable & Reusable 
