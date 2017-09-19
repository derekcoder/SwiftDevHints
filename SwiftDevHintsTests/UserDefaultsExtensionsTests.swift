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
    
    let defaults = UserDefaults.standard

    let username = "Derek"
    let password = "Password"
    let age = 29
    let latitude = 1.290270
    let longitude = 103.851959
    let profilePhotoURL = URL(string: "http://www.derekcoder.com/photos/1")!
    let isOnline = true
    let height: Float = 1.83
    
    func testGet() {
        defaults.set(username, forName: .Username)
        defaults.set(password, forName: .Password)
        defaults.set(age, forName: .Age)
        defaults.set(latitude, forName: .Latitude)
        defaults.set(longitude, forName: .Longitude)
        defaults.set(profilePhotoURL, forName: .ProfilePhotoURL)
        defaults.set(isOnline, forName: .IsOnline)
        defaults.set(height, forName: .Height)

        XCTAssert(defaults.string(forName: .Username) == username)
        XCTAssert((defaults.object(forName: .Password) as! String) == password)
        XCTAssert(defaults.integer(forName: .Age) == age)
        XCTAssert(defaults.double(forName: .Latitude) == latitude)
        XCTAssert((defaults.object(forName: .Longitude) as! Double) == longitude)
        XCTAssert(defaults.url(forName: .ProfilePhotoURL) == profilePhotoURL)
        XCTAssertTrue(defaults.bool(forName: .IsOnline))
        XCTAssert(defaults.float(forName: .Height) == height)
        
        defaults.set(nil, forName: .Username)
        defaults.set(nil, forName: .Password)
        defaults.set(nil, forName: .Age)
        defaults.set(nil, forName: .Latitude)
        defaults.set(nil, forName: .Longitude)
        defaults.set(nil, forName: .ProfilePhotoURL)
        defaults.set(nil, forName: .IsOnline)
        defaults.set(nil, forName: .Height)
    }
    
    func testStringDefaultValue() {
        XCTAssertEqual(defaults.string(forName: .Username, defaultValue: "Unknown"), "Unknown")
        defaults.set(username, forName: .Username)
        XCTAssertEqual(defaults.string(forName: .Username, defaultValue: "Unknown"), username)
    }
}
