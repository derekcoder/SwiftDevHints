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
    
    func testNumberValue() {
        let dictionary: [String: Any] = ["id": "1", "name": "Derek", "age": 29, "isOnline": true, "latitude": 1.290270, "longitude": 103.851959]

        let id = dictionary.numberValue(forKey: "id")
        XCTAssertTrue(id == 1)
        
        let age = dictionary.numberValue(forKey: "age")
        XCTAssertTrue(age == 29)
        
        let isOnline = dictionary.numberValue(forKey: "isOnline")
        XCTAssertTrue(isOnline.boolValue)
        
        let latitude = dictionary.numberValue(forKey: "latitude")
        XCTAssertTrue(latitude == 1.290270)
        
        let longitude = dictionary.numberValue(forKey: "longitude")
        XCTAssertTrue(longitude == 103.851959)
        
        let name = dictionary.numberValue(forKey: "name")
        XCTAssertTrue(name == 0.0)
    }
    
    func testStringValue() {
        let dictionary: [String: Any] = ["key1": 1, "key2": true, "key3": "yes", "key4": 3.4, "key5": 0, "key6": 0.0, "key7": "derek"]
        
        var value = dictionary.stringValue(forKey: "key1")
        XCTAssertTrue(value == "1")
        
        value = dictionary.stringValue(forKey: "key2")
        XCTAssertTrue(value == "1")
        
        value = dictionary.stringValue(forKey: "key3")
        XCTAssertTrue(value == "yes")
        
        value = dictionary.stringValue(forKey: "key4")
        XCTAssertTrue(value == "3.4")
        
        value = dictionary.stringValue(forKey: "key5")
        XCTAssertTrue(value == "0")

        value = dictionary.stringValue(forKey: "key6")
        XCTAssertTrue(value == "0")

        value = dictionary.stringValue(forKey: "key7")
        XCTAssertTrue(value == "derek")
    }
    
    func testBoolValue() {
        let dictionary: [String: Any] = ["key1": 1, "key2": true, "key3": "yes", "key4": "1", "key5": 3.4, "key6": 0, "key7": 0.0, "key8": "derek"]

        var value = dictionary.boolValue(forKey: "key1")
        XCTAssertTrue(value)
        
     	value = dictionary.boolValue(forKey: "key2")
        XCTAssertTrue(value)
        
        value = dictionary.boolValue(forKey: "key3")
        XCTAssertTrue(value)

        value = dictionary.boolValue(forKey: "key4")
        XCTAssertTrue(value)

        value = dictionary.boolValue(forKey: "key5")
        XCTAssertTrue(value)

        value = dictionary.boolValue(forKey: "key6")
        XCTAssertFalse(value)

        value = dictionary.boolValue(forKey: "key7")
        XCTAssertFalse(value)
        
        value = dictionary.boolValue(forKey: "key8")
        XCTAssertFalse(value)
    }
    
    func testValueOrAdd() {
        var colors = ["red": UIColor.red]
        let blue = colors.value(for: "blue", orAdd: UIColor.blue)
        XCTAssertEqual(blue, UIColor.blue)
        XCTAssertTrue(colors.count == 2)
    }
}
