//
//  PrintHelper.swift
//  SwiftDevHints
//
//  Created by ZHOU DENGFENG on 31/7/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import Foundation

/// Cutomized print method. Only valid in DEBUG mode.
///
///     debugPrintLog("You just tap button.")
///     // PrintHelperViewController.swift:15  You just tap button.
///
/// - Parameters:
///   - message: The message to print.
///   - file: The name of file that `debugPrintLog` is in.
///   - line: The line number that `debugPrintLog` is on.
public func debugPrintLog<T>(_ message: T, file: String = #file, line: Int = #line) {
    #if DEBUG
        print("\((file as NSString).lastPathComponent):\(line)  \(message)")
    #endif
}
