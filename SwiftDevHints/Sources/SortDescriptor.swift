//
//  SortDescriptor.swift
//  SwiftDevHints
//
//  Created by Derek on 22/1/18.
//  Copyright © 2018 ZHOU DENGFENG DEREK. All rights reserved.
//

import Foundation

public typealias SortDescriptor<A> = (A, A) -> Bool

public func sortDescriptor<V, P>(property: @escaping (V) -> P, comparator: @escaping (P) -> (P) -> ComparisonResult) -> SortDescriptor<V> {
    return { value1, value2 in
        comparator(property(value1))(property(value2)) == .orderedAscending
    }
}

public func sortDescriptor<V, P>(property: @escaping (V) -> P) -> SortDescriptor<V> where P: Comparable {
    return { value1, value2 in property(value1) < property(value2) }
}

public func combine<A>(sortDescriptors: [SortDescriptor<A>]) -> SortDescriptor<A> {
    return { value1, value2 in
        for descriptor in sortDescriptors {
            if descriptor(value1, value2) { return true }
            if descriptor(value2, value1) { return false }
        }
        return false
    }
}
