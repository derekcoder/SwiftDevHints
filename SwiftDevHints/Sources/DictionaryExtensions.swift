//
//  DictionaryExtensions.swift
//  SwiftDevHints
//
//  Created by ZHOU DENGFENG on 1/8/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import Foundation

public enum Type: Int {
    case number
    case bool
    case string
    case array
    case dictionary
    case null
    case unknown
    
    public static func type(forValue value: Any) -> Type {
        switch value {
        case let number as NSNumber:
            if number.isBool {
                return .bool
            } else {
                return .number
            }
        case _ as String: return .string
        case _ as NSNull: return .null
        case _ as [Any]: return .array
        case _ as [String: Any]: return .dictionary
        default: return .unknown
        }
    }
}

extension Dictionary where Key: CustomStringConvertible {
    
    /// Returns the NSNumber value for the given key.
	///
    /// - Parameter key: The key to find in the dictionary
    /// - Returns: The NSNumber value for `key` if `key` in the dictionary, otherwise, `0`.
    public func numberValue(forKey key: Key) -> NSNumber {
        guard let value = self[key] else { return NSNumber(value: 0.0) }
        
        let type = Type.type(forValue: value)
        
        switch type {
        case .bool: return (value as! NSNumber)
        case .number: return (value as! NSNumber)
        case .string:
            let decimal = NSDecimalNumber(string: value as? String)
            if decimal == NSDecimalNumber.notANumber {
                return NSDecimalNumber.zero
            }
            return decimal
        default: return false
        }
    }

    /// Returns the String value for the given key.
    ///
    /// - Parameter key: The key to find in the dictionary.
    /// - Returns: The String value for key if key in the dictionary, otherwise, "".
    public func stringValue(forKey key: Key) -> String {
        guard let value = self[key] else { return "" }
        
        let type = Type.type(forValue: value)
        
        switch type {
        case .string: return (value as! String)
        case .bool: return numberValue(forKey: key).stringValue
        case .number: return numberValue(forKey: key).stringValue
        default: return ""
        }
    }
    
    /// Returns the Bool value for the given key.
    ///
    /// If type of the object for the given key is String and its value is "true" or "yes" or "1", this method will return `true`.
    ///
    /// - Parameter key: The key to find in the dictionary.
    /// - Returns: The Bool value for `key` if `key` in the dictionary, otherwise, `false`.
    public func boolValue(forKey key: Key) -> Bool {
        guard let value = self[key] else { return false }
        
        let type = Type.type(forValue: value)
        
        switch type {
        case .bool: return numberValue(forKey: key).boolValue
        case .number: return numberValue(forKey: key).boolValue
        case .string:
            return ["true", "yes", "1"].contains() { string in
                return (value as! String).caseInsensitiveCompare(string) == .orderedSame
            }
        default: return false
        }
    }
    
    /// Return the Int value for the given key.
    ///
    /// - Parameter key: The key to find in the dictionary.
    /// - Returns: The Int value for `key`.
    public func intValue(forKey key: Key) -> Int {
		return numberValue(forKey: key).intValue
    }
    
    /// Return the UInt value for the given key.
    ///
    /// - Parameter key: The key to find in the dictionary.
    /// - Returns: The UInt value for `key`.
    public func uIntValue(forKey key: Key) -> UInt {
        return numberValue(forKey: key).uintValue
    }
    
    /// Return the Int8 value for the given key.
    ///
    /// - Parameter key: The key to find in the dictionary.
    /// - Returns: The Int8 value for `key`.
    public func int8Value(forKey key: Key) -> Int8 {
        return numberValue(forKey: key).int8Value
    }

    /// Return the UInt8 value for the given key.
    ///
    /// - Parameter key: The key to find in the dictionary.
    /// - Returns: The UInt8 value for `key`.
    public func uInt8Value(forKey key: Key) -> UInt8 {
        return numberValue(forKey: key).uint8Value
    }
    
    /// Return the Int16 value for the given key.
    ///
    /// - Parameter key: The key to find in the dictionary.
    /// - Returns: The Int16 value for `key`.
    public func int16Value(forKey key: Key) -> Int16 {
        return numberValue(forKey: key).int16Value
    }
    
    /// Return the UInt16 value for the given key.
    ///
    /// - Parameter key: The key to find in the dictionary.
    /// - Returns: The UInt16 value for `key`.
    public func uInt16Value(forKey key: Key) -> UInt16 {
        return numberValue(forKey: key).uint16Value
    }
    
    /// Return the Int32 value for the given key.
    ///
    /// - Parameter key: The key to find in the dictionary.
    /// - Returns: The Int32 value for `key`.
    public func int32Value(forKey key: Key) -> Int32 {
        return numberValue(forKey: key).int32Value
    }
    
    /// Return the UInt32 value for the given key.
    ///
    /// - Parameter key: The key to find in the dictionary.
    /// - Returns: The UInt32 value for `key`.
    public func uInt32Value(forKey key: Key) -> UInt32 {
        return numberValue(forKey: key).uint32Value
    }
    
    /// Return the Int64 value for the given key.
    ///
    /// - Parameter key: The key to find in the dictionary.
    /// - Returns: The Int64 value for `key`.
    public func int64Value(forKey key: Key) -> Int64 {
        return numberValue(forKey: key).int64Value
    }
    
    /// Return the UInt64 value for the given key.
    ///
    /// - Parameter key: The key to find in the dictionary.
    /// - Returns: The UInt64 value for `key`.
    public func uInt64Value(forKey key: Key) -> UInt64 {
        return numberValue(forKey: key).uint64Value
    }
    
    /// Return the Double value for the given key.
    ///
    /// - Parameter key: The key to find in the dictionary.
    /// - Returns: The Double value for `key`.
    public func doubleValue(forKey key: Key) -> Double {
        return numberValue(forKey: key).doubleValue
    }
    
    /// Return the Float value for the given key.
    ///
    /// - Parameter key: The key to find in the dictionary.
    /// - Returns: The Float value for `key`.
    public func floatValue(forKey key: Key) -> Float {
        return numberValue(forKey: key).floatValue
    }
}

////////////////////////////////////////////
// Dictionary Map Function
////////////////////////////////////////////
extension Dictionary {
    public func map<T>(_ transform: ((Key) throws -> T)) rethrows -> [T: Value] {
        var newDict: [T: Value] = [:]
        for (key, value) in self {
            let newKey = try transform(key)
            newDict[newKey] = value
        }
        return newDict
    }
}

extension Dictionary {
    public mutating func value(for key: Key, orAdd closure: @autoclosure () -> Value) -> Value {
        if let value = self[key] {
         	return value
        }
        
        let value = closure()
        self[key] = value
        return value
    }
}







