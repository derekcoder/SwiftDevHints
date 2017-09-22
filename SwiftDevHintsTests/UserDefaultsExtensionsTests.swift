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
    public static let Password: UserDefaults.Name = "SwiftDevHints.Password"
    public static let Age: UserDefaults.Name = "SwiftDevHints.Age"
    public static let Latitude: UserDefaults.Name = "SwiftDevHints.Latitude"
    public static let Longitude: UserDefaults.Name = "SwiftDevHints.Longitude"
    public static let ProfilePhotoURL: UserDefaults.Name = "SwiftDevHints.ProfilePhotoURL"
    public static let IsOnline: UserDefaults.Name = "SwiftDevHints.IsOnline"
    public static let Height: UserDefaults.Name = "SwiftDevHints.Height"
}

class UserDefaultsExtensionsTests: XCTestCase {
    
    let username = "Derek"
    let password = "Password"
    let age = 29
    let latitude = 1.290270
    let longitude = 103.851959
    let profilePhotoURL = URL(string: "http://www.derekcoder.com/photos/1")!
    let isOnline = true
    let height: Float = 1.83
    
    override func setUp() {
        super.setUp()
        
        let defaults = UserDefaults.standard
        
        defaults.removeObject(forName: .Username)
        defaults.removeObject(forName: .Password)
        defaults.removeObject(forName: .Age)
        defaults.removeObject(forName: .Latitude)
        defaults.removeObject(forName: .Longitude)
        defaults.removeObject(forName: .ProfilePhotoURL)
        defaults.removeObject(forName: .IsOnline)
        defaults.removeObject(forName: .Height)
        defaults.synchronize()
    }
    
    func testGet() {
        let defaults = UserDefaults.standard

        defaults.set(username, forName: .Username)
        defaults.set(password, forName: .Password)
        defaults.set(age, forName: .Age)
        defaults.set(latitude, forName: .Latitude)
        defaults.set(longitude, forName: .Longitude)
        defaults.set(profilePhotoURL, forName: .ProfilePhotoURL)
        defaults.set(isOnline, forName: .IsOnline)
        defaults.set(height, forName: .Height)
        defaults.synchronize()

        XCTAssert(defaults.string(forName: .Username) == username)
        XCTAssert((defaults.object(forName: .Password) as! String) == password)
        XCTAssert(defaults.integer(forName: .Age) == age)
        XCTAssert(defaults.double(forName: .Latitude) == latitude)
        XCTAssert((defaults.object(forName: .Longitude) as! Double) == longitude)
        XCTAssert(defaults.url(forName: .ProfilePhotoURL) == profilePhotoURL)
        XCTAssertTrue(defaults.bool(forName: .IsOnline))
        XCTAssert(defaults.float(forName: .Height) == height)
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
}
