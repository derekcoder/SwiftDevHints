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
    public static let Password: UserDefaults.Name = "SwiftDevHints.Password"
}

class UserDefaultsExtensionsTests: XCTestCase {
    private var userDefaults: UserDefaults!
    
    override func setUp() {
        super.setUp()
        
        userDefaults = UserDefaults(suiteName: "test")
        userDefaults.removePersistentDomain(forName: "test")
    }
    
    func testString() {
        let username = "Derek"
        userDefaults.set(username, forName: .Username)
        userDefaults.synchronize()
        XCTAssertEqual(userDefaults.string(forName: .Username), username)
    }
    
    func testInt() {
        let age = 29
        userDefaults.set(age, forName: .Age)
        userDefaults.synchronize()
        XCTAssertEqual(userDefaults.integer(forName: .Age), age)
    }
    
    func testDouble() {
        let latitude = 1.290270
        userDefaults.set(latitude, forName: .Latitude)
        userDefaults.synchronize()
        XCTAssertEqual(userDefaults.double(forName: .Latitude), latitude)
    }

    func testURL() {
        let profilePhotoURL = URL(string: "http://www.derekcoder.com/photos/1")!
        userDefaults.set(profilePhotoURL, forName: .ProfilePhotoURL)
        userDefaults.synchronize()
        XCTAssertEqual(userDefaults.url(forName: .ProfilePhotoURL), profilePhotoURL)
    }

    func testBool() {
        let isOnline = true
        userDefaults.set(isOnline, forName: .IsOnline)
        userDefaults.synchronize()
        XCTAssertEqual(userDefaults.bool(forName: .IsOnline), true)
    }
    
    func testFloat() {
        let height: Float = 1.83
        userDefaults.set(height, forName: .Height)
        userDefaults.synchronize()
        XCTAssertEqual(userDefaults.float(forName: .Height), height)
    }
    
    func testStringDefaultValue() {
        let testName: UserDefaults.Name = "testName"
        let value = userDefaults.string(forName: testName, defaultValue: "Unknown")
        XCTAssertEqual(value, "Unknown")
    }
    
    func testStringDefaultValueWithValue() {
        let testName: UserDefaults.Name = "testName"
        userDefaults.set("test", forName: testName)
        userDefaults.synchronize()
        XCTAssertEqual(userDefaults.string(forName: testName, defaultValue: "Unknown"), "test")
    }
    
    func testRegisterDefaults() {
        userDefaults.register(defaults: [.Password: "1234"])
        XCTAssertEqual(userDefaults.string(forName: .Password), "1234")
    }
    
    struct Product: Codable {
        var id: String
        var name: String
    }
    
    func testCodable() {
        let iPhone = Product(id: "u-xxxx-xxxx", name: "iPhone X")
        userDefaults.set(encodable: iPhone, forKey: "iPhoneX")
        userDefaults.synchronize()
        
        XCTAssertEqual(userDefaults.decodableObject(type: Product.self, forKey: "iPhoneX")!.id, "u-xxxx-xxxx")
        XCTAssertEqual(userDefaults.decodableObject(type: Product.self, forKey: "iPhoneX")!.name, "iPhone X")
    }
}



















