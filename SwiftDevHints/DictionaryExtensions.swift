//
//  DictionaryExtensions.swift
//  SwiftDevHints
//
//  Created by Julie on 1/8/17.
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
    
    public func intValue(forKey key: Key) -> Int {
		return numberValue(forKey: key).intValue
    }
    
    public func uIntValue(forKey key: Key) -> UInt {
        return numberValue(forKey: key).uintValue
    }
    
    public func int8Value(forKey key: Key) -> Int8 {
        return numberValue(forKey: key).int8Value
    }

    public func uInt8Value(forKey key: Key) -> UInt8 {
        return numberValue(forKey: key).uint8Value
    }
    
    public func int16Value(forKey key: Key) -> Int16 {
        return numberValue(forKey: key).int16Value
    }
    
    public func uInt16Value(forKey key: Key) -> UInt16 {
        return numberValue(forKey: key).uint16Value
    }
    
    public func int32Value(forKey key: Key) -> Int32 {
        return numberValue(forKey: key).int32Value
    }
    
    public func uInt32Value(forKey key: Key) -> UInt32 {
        return numberValue(forKey: key).uint32Value
    }
    
    public func int64Value(forKey key: Key) -> Int64 {
        return numberValue(forKey: key).int64Value
    }
    
    public func uInt64Value(forKey key: Key) -> UInt64 {
        return numberValue(forKey: key).uint64Value
    }
    
    public func uInt8Value(forKey key: Key) -> Int {
        return numberValue(forKey: key).intValue
    }

    public func doubleValue(forKey key: Key) -> Double {
        return numberValue(forKey: key).doubleValue
    }
    
    public func floatValue(forKey key: Key) -> Float {
        return numberValue(forKey: key).floatValue
    }
}

