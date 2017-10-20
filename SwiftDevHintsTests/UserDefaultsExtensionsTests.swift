//
//  UserDefaultsExtensionsTests.swift
//  SwiftDevHintsTests
//
//  Created by ZHOU DENGFENG on 1/8/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import XCTest
@testable import SwiftDevHints

extension UserDefaults.Name {
    public static let Username: UserDefaults.Name = "SwiftDevHints.Username"
    public static let Age: UserDefaults.Name = "SwiftDevHints.Age"
    public static let Latitude: UserDefaults.Name = "SwiftDevHints.Latitude"
    public static let ProfilePhotoURL: UserDefaults.Name = "SwiftDevHints.ProfilePhotoURL"
    public static let IsOnline: UserDefaults.Name = "SwiftDevHints.IsOnline"
    public static let Height: UserDefaults.Name = "SwiftDevHints.Height"
}

class UserDefaultsExtensionsTests: XCTestCase {
    
    let username = "Derek"
    let age = 29
    let latitude = 1.290270
    let profilePhotoURL = URL(string: "http://www.derekcoder.com/photos/1")!
    let isOnline = true
    let height: Float = 1.83
    
    func testString() {
        let defaults = UserDefaults.standard
        defaults.set(username, forName: .Username)
		defaults.synchronize()
        XCTAssertEqual(defaults.string(forName: .Username), username)
    }
    
    func testInt() {
        let defaults = UserDefaults.standard
        defaults.set(age, forName: .Age)
        defaults.synchronize()
        XCTAssertEqual(defaults.integer(forName: .Age), age)
    }
    
    func testDouble() {
        let defaults = UserDefaults.standard
        defaults.set(latitude, forName: .Latitude)
        defaults.synchronize()
        XCTAssertEqual(defaults.double(forName: .Latitude), latitude)
    }

    func testURL() {
        let defaults = UserDefaults.standard
        defaults.set(profilePhotoURL, forName: .ProfilePhotoURL)
        defaults.synchronize()
        XCTAssertEqual(defaults.url(forName: .ProfilePhotoURL), profilePhotoURL)
    }

    func testBool() {
        let defaults = UserDefaults.standard
        defaults.set(isOnline, forName: .IsOnline)
        defaults.synchronize()
        XCTAssertEqual(defaults.bool(forName: .IsOnline), true)
    }
    
    func testFloat() {
        let defaults = UserDefaults.standard
        defaults.set(height, forName: .Height)
        defaults.synchronize()
        XCTAssertEqual(defaults.float(forName: .Height), height)
    }
    
    func testStringDefaultValue() {
        let defaults = UserDefaults.standard
        
        let testName: UserDefaults.Name = "testName"
        let value = defaults.string(forName: testName, defaultValue: "Unknown")
        XCTAssertEqual(value, "Unknown")
    }
    
    func testStringDefaultValueWithValue() {
        let defaults = UserDefaults.standard

        defaults.set(username, forName: .Username)
        defaults.synchronize()
        XCTAssertEqual(defaults.string(forName: .Username, defaultValue: "Unknown"), username)
    }
    
    struct Product: Codable {
        var id: String
        var name: String
    }
    
    func testCodable() {
        let defaults = UserDefaults.standard
        
        let iPhone = Product(id: "u-xxxx-xxxx", name: "iPhone X")
        defaults.set(encodable: iPhone, forKey: "iPhoneX")
        defaults.synchronize()
        
        XCTAssertEqual(defaults.decodableObject(type: Product.self, forKey: "iPhoneX")!.id, "u-xxxx-xxxx")
        XCTAssertEqual(defaults.decodableObject(type: Product.self, forKey: "iPhoneX")!.name, "iPhone X")
    }
}



















