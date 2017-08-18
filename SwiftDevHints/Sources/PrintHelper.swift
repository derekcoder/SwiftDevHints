//
//  PrintHelper.swift
//  SwiftDevHints
//
//  Created by ZHOU DENGFENG on 31/7/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import Foundation

public func debugPrintLog<T>(_ message: T, file: String = #file, line: Int = #line) {
    #if DEBUG
        print("\((file as NSString).lastPathComponent):\(line)  \(message)")
    #endif
}
