//
//  OptionalExtensions.swift
//  SwiftDevHints
//
//  Created by Derek on 12/12/18.
//  Copyright © 2018 ZHOU DENGFENG DEREK. All rights reserved.
//

import Foundation

public extension Optional {
    /// true for nil, false for a wrapped value
    var isNone: Bool {
        switch self {
        case .none: return true
        case .some: return false
        }
    }
    
    /// true for a wrapped value, false for nil,
    var isSome: Bool {
        return !isNone
    }
    
    func zip2<A>(with other: A?) -> (Wrapped, A)? {
        guard let first = self,
            let second = other else {
            return nil
        }
        return (first, second)
    }
    
    func zip3<A, B>(with other: A?, another: B?) -> (Wrapped, A, B)? {
        guard let first = self,
            let second = other,
            let third = another else {
            return nil
        }
        return (first, second, third)
    }
    
    func orThrow(_ errorExpression: @autoclosure () -> Error) throws -> Wrapped {
        guard let value = self else {
            throw errorExpression()
        }
        return value
    }
    
    func matching(_ predicate: (Wrapped) -> Bool) -> Wrapped? {
        guard let value = self else { return nil }
        guard predicate(value) else { return nil }
        return value
    }
}

public extension Optional where Wrapped: Collection {
    /// The property will return true if optional is nil or it's wrapped value is empty.
    var isNilOrEmpty: Bool {
        return self?.isEmpty ?? true
    }
    
    /// The property will return nil if optional is nil or it's wrapped value is empty.
    var nilIfEmpty: Wrapped? {
        guard let value = self else { return nil }
        return value.isEmpty ? nil : value
    }
}
