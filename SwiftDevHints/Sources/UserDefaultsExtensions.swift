//
//  UserDefaultsExtensions.swift
//  SwiftDevHints
//
//  Created by ZHOU DENGFENG on 1/8/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    public struct Name: RawRepresentable, Equatable {
        public var rawValue: String
        
        public init(_ rawValue: String) {
            self.rawValue = rawValue
        }
        
        public init(rawValue: String) {
            self.rawValue = rawValue
        }
    }
    
    public func object(forName name: UserDefaults.Name) -> Any? {
        return object(forKey: name.rawValue)
    }

    public func set(_ value: Any?, forName name: UserDefaults.Name) {
        set(value, forKey: name.rawValue)
    }
    
    public func removeObject(forName name: UserDefaults.Name) {
        removeObject(forKey: name.rawValue)
    }
    
    public func string(forName name: UserDefaults.Name) -> String? {
        return string(forKey: name.rawValue)
    }
    
    public func array(forName name: UserDefaults.Name) -> [Any]? {
        return array(forKey: name.rawValue)
    }
    
    public func dictionary(forName name: UserDefaults.Name) -> [String: Any]? {
        return dictionary(forKey: name.rawValue)
    }
    
    public func data(forName name: UserDefaults.Name) -> Data? {
        return data(forKey: name.rawValue)
    }
    
    public func stringArray(forName name: UserDefaults.Name) -> [String]? {
        return stringArray(forKey: name.rawValue)
    }
    
    public func integer(forName name: UserDefaults.Name) -> Int {
        return integer(forKey: name.rawValue)
    }
    
    public func float(forName name: UserDefaults.Name) -> Float {
        return float(forKey: name.rawValue)
    }
    
    public func double(forName name: UserDefaults.Name) -> Double {
        return double(forKey: name.rawValue)
    }
    
    public func bool(forName name: UserDefaults.Name) -> Bool {
        return bool(forKey: name.rawValue)
    }
    
    public func url(forName name: UserDefaults.Name) -> URL? {
        return url(forKey: name.rawValue)
    }
    
    public func set(_ value: Int, forName name: UserDefaults.Name) {
        set(value, forKey: name.rawValue)
    }
    
    public func set(_ value: Float, forName name: UserDefaults.Name) {
        set(value, forKey: name.rawValue)
    }

    public func set(_ value: Double, forName name: UserDefaults.Name) {
        set(value, forKey: name.rawValue)
    }

    public func set(_ value: Bool, forName name: UserDefaults.Name) {
        set(value, forKey: name.rawValue)
    }
    
    public func set(_ url: URL?, forName name: UserDefaults.Name) {
        set(url, forKey: name.rawValue)
    }
}

extension UserDefaults.Name: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self.rawValue = value
    }
    
    public init(unicodeScalarLiteralType value: String) {
        self.init(stringLiteral: value)
    }
    
    public init(extendedGraphemeClusterLiteralType value: String) {
        self.init(stringLiteral: value)
    }
}
