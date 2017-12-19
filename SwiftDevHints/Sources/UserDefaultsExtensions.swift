//
//  UserDefaultsExtensions.swift
//  SwiftDevHints
//
//  Created by ZHOU DENGFENG on 1/8/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    public struct Name: RawRepresentable, Hashable {
        public var rawValue: String
        
        public init(rawValue: String) {
            self.rawValue = rawValue
        }
        
        public var hashValue: Int {
            return rawValue.hashValue
        }

        public static func ==(lhs: Name, rhs: Name) -> Bool {
            return lhs.rawValue == rhs.rawValue
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
    
    public func string(forName name: UserDefaults.Name, defaultValue: String) -> String {
        return string(forKey: name.rawValue) ?? defaultValue
    }
    
    public func array(forName name: UserDefaults.Name) -> [Any]? {
        return array(forKey: name.rawValue)
    }
    
    public func array(forName name: UserDefaults.Name, defaultValue: [Any]) -> [Any] {
        return array(forKey: name.rawValue) ?? defaultValue
    }
    
    public func dictionary(forName name: UserDefaults.Name) -> [String: Any]? {
        return dictionary(forKey: name.rawValue)
    }
    
    public func dictionary(forName name: UserDefaults.Name, defaultValue: [String: Any]) -> [String: Any] {
        return dictionary(forKey: name.rawValue) ?? defaultValue
    }
    
    public func data(forName name: UserDefaults.Name) -> Data? {
        return data(forKey: name.rawValue)
    }
    
    public func data(forName name: UserDefaults.Name, defaultValue: Data) -> Data {
        return data(forKey: name.rawValue) ?? defaultValue
    }
    
    public func stringArray(forName name: UserDefaults.Name) -> [String]? {
        return stringArray(forKey: name.rawValue)
    }
    
    public func stringArray(forName name: UserDefaults.Name, defaultValue: [String]) -> [String] {
        return stringArray(forKey: name.rawValue) ?? defaultValue
    }
    
    public func url(forName name: UserDefaults.Name) -> URL? {
        return url(forKey: name.rawValue)
    }
    
    public func url(forName name: UserDefaults.Name, defaultValue: URL) -> URL {
        return url(forKey: name.rawValue) ?? defaultValue
    }
    
    public func set(_ url: URL?, forName name: UserDefaults.Name) {
        set(url, forKey: name.rawValue)
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
    
    public func register(defaults registrationDictionary: [UserDefaults.Name : Any]) {
        let dict = registrationDictionary.map { $0.rawValue }
        register(defaults: dict)
    }
}

extension UserDefaults.Name: ExpressibleByStringLiteral {
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

extension UserDefaults {
    public func register(defaults plistURL: URL) throws {
        let data = try Data(contentsOf: plistURL)
        guard data.count > 0 else { return }
        guard let dict = try PropertyListSerialization.propertyList(from: data, format: nil) as? [String: Any] else { return }
        register(defaults: dict)
    }
}

////////////////////////////////////////////
// Support Codable
////////////////////////////////////////////
extension UserDefaults {
    public func set<T>(encodable object: T, forKey key: String) where T: Codable {
        let encoder = JSONEncoder()
        let data = try? encoder.encode(object)
        set(data as Any?, forKey: key)
    }
    
    public func decodableObject<T>(type: T.Type, forKey key: String) -> T? where T: Codable {
        guard let data = data(forKey: key) else {
            return nil
        }
        
        let decoder = JSONDecoder()
        return try? decoder.decode(type, from: data)
    }
    
    public func set<T>(encodable object: T, forName name: UserDefaults.Name) where T: Codable {
        set(encodable: object, forKey: name.rawValue)
    }
    
    public func decodableObject<T>(type: T.Type, forName name: UserDefaults.Name) -> T? where T: Codable {
        return decodableObject(type: type, forKey: name.rawValue)
    }
}
