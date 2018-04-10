//
//  CollectionExtensions.swift
//  SwiftDevHints
//
//  Created by Derek on 10/4/18.
//  Copyright © 2018 ZHOU DENGFENG DEREK. All rights reserved.
//

import Foundation

extension Collection {
    
    /// The safe way to return element at specified index.
    /// Referenced from https://github.com/Luur/SwiftTips#1-safe-way-to-return-element-at-specified-index
    ///
    ///     let animals = ["Zebra", "Giraffe", "Tiger"]
    ///     animals[safe: 2] // Tiger
    ///     animals[safe: 3] // nil
    ///
    /// - Parameter position: The position of the element to access. If the **position** is not a valid index
    /// of the collection, return nil.
    subscript(safe position: Index) -> Element? {
        return indices.contains(position) ? self[position] : nil
    }
}
