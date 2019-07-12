//
//  DictionaryExtensionsTests.swift
//  SwiftDevHintsTests
//
//  Created by ZHOU DENGFENG on 1/8/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import XCTest
@testable import SwiftDevHints

class DictionaryExtensionsTests: XCTestCase {
    
    func testTypeForValue() {
        var aNumber = NSNumber(value: 1)
        XCTAssertTrue(Type.type(forValue: aNumber) == .number)
        
        aNumber = NSNumber(value: 1.0)
        XCTAssertTrue(Type.type(forValue: aNumber) == .number)
        
        aNumber = NSNumber(value: true)
        XCTAssertTrue(Type.type(forValue: aNumber) == .bool)
        
        aNumber = NSNumber(value: false)
        XCTAssertTrue(Type.type(forValue: aNumber) == .bool)
        
        let aString = "Hello, World!"
        XCTAssertTrue(Type.type(forValue: aString) == .string)
        
        let aArray = ["iPhone", "iPad", "iMac"]
        XCTAssertTrue(Type.type(forValue: aArray) == .array)
        
        let aDictionary: [String: Any] = ["id": 1, "name": "Derek", "age": 29]
        XCTAssertTrue(Type.type(forValue: aDictionary) == .dictionary)
        
        let aNull = NSNull()
        XCTAssertTrue(Type.type(forValue: aNull) == .null)
        
        let aCell = UITableViewCell()
        XCTAssertTrue(Type.type(forValue: aCell) == .unknown)
    }
    
    func testNumber() {
        let dictionary: [String: Any] = ["id": "1", "name": "Derek", "age": 29, "isOnline": true, "latitude": 1.290270, "longitude": 103.851959]

        XCTAssertEqual(dictionary.numberValue(forKey: "id"), 1)
        XCTAssertEqual(dictionary.number(forKey: "id"), 1)
        XCTAssertNil(dictionary.number(forKey: "id2"))
        
        XCTAssertEqual(dictionary.numberValue(forKey: "age"), 29)
        XCTAssertEqual(dictionary.number(forKey: "age"), 29)
        
        XCTAssertTrue(dictionary.numberValue(forKey: "isOnline").boolValue)
        XCTAssertTrue(dictionary.number(forKey: "isOnline")!.boolValue)
        
        XCTAssertEqual(dictionary.numberValue(forKey: "latitude"), 1.290270)
        XCTAssertEqual(dictionary.number(forKey: "latitude"), 1.290270)
        
        XCTAssertEqual(dictionary.numberValue(forKey: "longitude"), 103.851959)
        XCTAssertEqual(dictionary.number(forKey: "longitude"), 103.851959)
        
        XCTAssertEqual(dictionary.numberValue(forKey: "name"), 0.0)
        XCTAssertEqual(dictionary.number(forKey: "name"), 0.0)
    }
    
    func testString() {
        let dictionary: [String: Any] = ["key1": 1, "key2": true, "key3": "yes", "key4": 3.4, "key5": 0, "key6": 0.0, "key7": "derek"]
        
        XCTAssertEqual(dictionary.stringValue(forKey: "key1"), "1")
        XCTAssertEqual(dictionary.string(forKey: "key1"), "1")
        XCTAssertNil(dictionary.string(forKey: "key11"))
        
        XCTAssertEqual(dictionary.stringValue(forKey: "key2"), "1")
        XCTAssertEqual(dictionary.string(forKey: "key2"), "1")
        
        XCTAssertEqual(dictionary.stringValue(forKey: "key3"), "yes")
        XCTAssertEqual(dictionary.string(forKey: "key3"), "yes")
        
        XCTAssertEqual(dictionary.stringValue(forKey: "key4"), "3.4")
        XCTAssertEqual(dictionary.string(forKey: "key4"), "3.4")
        
        XCTAssertEqual(dictionary.stringValue(forKey: "key5"), "0")
        XCTAssertEqual(dictionary.string(forKey: "key5"), "0")

        XCTAssertEqual(dictionary.stringValue(forKey: "key6"), "0")
        XCTAssertEqual(dictionary.string(forKey: "key6"), "0")

        XCTAssertEqual(dictionary.stringValue(forKey: "key7"), "derek")
        XCTAssertEqual(dictionary.string(forKey: "key7"), "derek")
    }
    
    func testBool() {
        let dictionary: [String: Any] = ["key1": 1, "key2": true, "key3": "yes", "key4": "1", "key5": 3.4, "key6": 0, "key7": 0.0, "key8": "derek"]

        XCTAssertTrue(dictionary.boolValue(forKey: "key1"))
        XCTAssertTrue(dictionary.bool(forKey: "key1")!)
        XCTAssertNil(dictionary.bool(forKey: "key11"))
        
        XCTAssertTrue(dictionary.boolValue(forKey: "key2"))
        XCTAssertTrue(dictionary.bool(forKey: "key2")!)
        
        XCTAssertTrue(dictionary.boolValue(forKey: "key3"))
        XCTAssertTrue(dictionary.bool(forKey: "key3")!)

        XCTAssertTrue(dictionary.boolValue(forKey: "key4"))
        XCTAssertTrue(dictionary.bool(forKey: "key4")!)

        XCTAssertTrue(dictionary.boolValue(forKey: "key5"))
        XCTAssertTrue(dictionary.bool(forKey: "key5")!)

        XCTAssertFalse(dictionary.boolValue(forKey: "key6"))
        XCTAssertFalse(dictionary.bool(forKey: "key6")!)

        XCTAssertFalse(dictionary.boolValue(forKey: "key7"))
        XCTAssertFalse(dictionary.bool(forKey: "key7")!)
        
        XCTAssertFalse(dictionary.boolValue(forKey: "key8"))
        XCTAssertFalse(dictionary.bool(forKey: "key8")!)
    }
    
    func testDict() {
        let dictionary: [String: Any] = ["user": ["name": "a"]]
        XCTAssertEqual(dictionary.dict(forKey: "user")?.string(forKey: "name"), "a")
        XCTAssertNil(dictionary.dict(forKey: "user1"))
    }
    
    func testDictArray() {
        let dictionary: [String: Any] = ["users": [["name": "a"], ["name": "b"]]]
        XCTAssertEqual(dictionary.dictArray(forKey: "users")?.first!.string(forKey: "name"), "a")
        XCTAssertNil(dictionary.dictArray(forKey: "users1"))
    }
    
    func testJSONDictAndStringSubscript() {
        var dict: [String: Any] = [
            "users": [
                "user1": [
                    "name": "a"
                ]
            ]
        ]
        
        dict[jsonDict: "users"]?[jsonDict: "user1"]?["name"] = "b"
        XCTAssertEqual(dict[jsonDict: "users"]?[jsonDict: "user1"]?.string(forKey: "name"), "b")
        XCTAssertEqual(dict.dict(forKey: "users")?.dict(forKey: "user1")?.string(forKey: "name"), "b")
    }
    
    func testStringSubscript() {
        var dict: [String: Any] = [
            "users": [
                "user1": [
                    "name": "a"
                ]
            ]
        ]

        dict[jsonDict: "users"]?[jsonDict: "user1"]?[string: "name"] = "b"
        dict[jsonDict: "users"]?[jsonDict: "user1"]?[string: "name"]?.append("!")
        XCTAssertEqual(dict[jsonDict: "users"]?[jsonDict: "user1"]?[string: "name"], "b!")
    }
    
    func testIntSubscript() {
        var dict: [String: Any] = [
            "users": [
                "user1": [
                    "name": "a",
                    "age": 1
                ]
            ]
        ]
        dict[jsonDict: "users"]?[jsonDict: "user1"]?[int: "age"] = 2
        XCTAssertEqual(dict[jsonDict: "users"]?[jsonDict: "user1"]?[int: "age"], 2)
    }
    
    func testMapKeys() {
        let dicts: [String: Int] = ["1": 1, "2": 2]
        XCTAssertEqual(dicts.mapKeys { return Int($0)! }, [1: 1, 2: 2])
    }
}
