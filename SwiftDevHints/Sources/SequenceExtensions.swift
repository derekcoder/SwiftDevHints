//
//  SequenceExtensions.swift
//  SwiftDevHints
//
//  Created by Derek on 17/10/17.
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

public protocol OptionalType {
    associatedtype T
    var asOptional: T? { get }
}

extension Optional: OptionalType {
    public typealias T = Wrapped
    public var asOptional: T? { return self }
}

extension Sequence where Element: OptionalType {
    public var compacted: [Element.T] {
        return self.compactMap { $0.asOptional }
    }
}
