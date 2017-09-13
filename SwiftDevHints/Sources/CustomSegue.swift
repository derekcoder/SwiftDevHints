//
//  CustomSegue.swift
//  Photos
//
//  Created by ZHOU DENGFENG on 5/8/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import Foundation

public struct CustomSegue: RawRepresentable {
    public var rawValue: String
    
    public init(_ rawValue: String) {
        self.rawValue = rawValue
    }
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

extension CustomSegue: ExpressibleByStringLiteral {
    public typealias UnicodeScalarLiteralType = String
    public typealias ExtendedGraphemeClusterLiteralType = String
    
    public init(stringLiteral value: String) {
        self.rawValue = value
    }
    
    public init(unicodeScalarLiteral value: String) {
        self.init(stringLiteral: value)
    }
    
    public init(extendedGraphemeClusterLiteral value: String) {
        self.init(stringLiteral: value)
    }
}

extension CustomSegue: Equatable {
    static public func ==(lhs: CustomSegue, rhs: CustomSegue) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}
