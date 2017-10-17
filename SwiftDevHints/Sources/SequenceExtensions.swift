//
//  SequenceExtensions.swift
//  SwiftDevHints
//
//  Created by Julie on 17/10/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import Foundation

extension Sequence {
    public func last(where predicate: (Iterator.Element) throws -> Bool) rethrows -> Iterator.Element? {
        for element in reversed() where try predicate(element) {
            return element
        }
        return nil
    }
    
    public func all(matching predicate: (Iterator.Element) -> Bool) -> Bool {
        return !contains { !predicate($0) }
    }
}
