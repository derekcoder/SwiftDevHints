//
//  Sound.swift
//  SwiftDevHints
//
//  Created by Derek on 28/1/19.
//  Copyright © 2019 ZHOU DENGFENG DEREK. All rights reserved.
//

import Foundation
import AudioToolbox

public struct Sound {
    public enum PlayType { case systemSound, alertSound }
    
    public private(set) var url: URL
    private var soundID: SystemSoundID = 0
    
    public init(url: URL) {
        self.url = url
        AudioServicesCreateSystemSoundID(url as CFURL, &soundID)
    }
    
    public init?(name: String, in bundle: Bundle) {
        guard let path = bundle.path(forResource: name, ofType: nil) else { return nil }
        guard let url = URL(string: path) else { return nil }
        self.init(url: url)
    }
    
    public func play(_ type: PlayType) {
        switch type {
        case .systemSound: AudioServicesPlaySystemSound(soundID)
        case .alertSound: AudioServicesPlayAlertSound(soundID)
        }
    }
}
