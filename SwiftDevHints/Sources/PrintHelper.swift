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
///     // PrintHelperViewController.swift:tapPrintLogButton():15 -> You just tap button.
///
/// - Parameters:
///   - message: The message to print.
///   - file: The location of file that `debugPrintLog` is in.
///   - function: The name of function that `debugPrintLog` is in.
///   - line: The line number that `debugPrintLog` is on.
public func debugPrintLog(_ message: Any? = nil, file: String = #file, function: String = #function, line: Int = #line) {
    #if DEBUG
        if let message = message {
            print("\((file as NSString).lastPathComponent):\(function):\(line) -> \(message)")
        } else {
            print("\((file as NSString).lastPathComponent):\(function):\(line)")
        }
    #endif
}
