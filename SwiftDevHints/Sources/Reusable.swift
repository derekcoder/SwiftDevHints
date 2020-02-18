//
//  UITableViewCellExtensions.swift
//  SwiftDevHints
//
//  Created by ZHOU DENGFENG on 15/7/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//
//  Reference
//  * [AliSoftware/Reusable](https://github.com/AliSoftware/Reusable)
//  * [andyyhope/nemo](https://github.com/andyyhope/nemo)

#if os(iOS)
import UIKit

public protocol Reusable: class {
    static var reuseIdentifier: String { get }
}

public extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

public typealias NibReusable = NibLoadable & Reusable 
#endif
