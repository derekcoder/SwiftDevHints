//
//  BundleExtensions.swift
//  SwiftDevHints
//
//  Created by Julie on 16/10/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import Foundation

extension Bundle {
    private enum InfoPlistKey: String {
        case name = "CFBundleName"
        case displayName = "CFBundleDisplayName"
        case developmentRegion = "CFBundleDevelopmentRegion"
        case identifier = "CFBundleIdentifier"
        case version = "CFBundleShortVersionString"
        case build = "CFBundleVersion"
        case packageType = "CFBundlePackageType"
    }
    
    private func objectForInfoPlistKey(_ key: InfoPlistKey) -> Any? {
        guard let dict = infoDictionary else { return nil }
        return dict[key.rawValue]
    }
    
    public var name: String? {
        return objectForInfoPlistKey(.name) as? String
    }
    
    public var displayName: String? {
        return objectForInfoPlistKey(.displayName) as? String
    }
    
 	public  var developmentRegion: String? {
        return objectForInfoPlistKey(.developmentRegion) as? String
    }
    
    public var identifier: String? {
        return objectForInfoPlistKey(.identifier) as? String
    }
    
    public var version: String? {
        return objectForInfoPlistKey(.version) as? String
    }
    
    public var build: String? {
        return objectForInfoPlistKey(.build) as? String
    }
    
    public var packageType: String? {
        return objectForInfoPlistKey(.packageType) as? String
    }
}
