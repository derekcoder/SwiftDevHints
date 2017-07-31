//
//  PrintHelper.swift
//  SwiftDevHints
//
//  Created by Julie on 31/7/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import Foundation

public func printLog<T>(_ message: T, file: String = #file, line: Int = #line) {
    #if DEBUG
        print("\((file as NSString).lastPathComponent):\(line)  \(message)")
    #endif
}
