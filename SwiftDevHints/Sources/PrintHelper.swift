//
//  PrintHelper.swift
//  SwiftDevHints
//
//  Created by ZHOU DENGFENG on 31/7/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import Foundation

public struct Log {
    public static func debug(_ message: Any? = nil, file: String = #file, function: String = #function, line: Int = #line) {
        printLog(style: .debug, message: message, file: file, function: function, line: line)
    }
    
    public static func warning(_ message: Any? = nil, file: String = #file, function: String = #function, line: Int = #line) {
        printLog(style: .warining, message: message, file: file, function: function, line: line)
    }
    
    public static func error(_ message: Any? = nil, file: String = #file, function: String = #function, line: Int = #line) {
        printLog(style: .error, message: message, file: file, function: function, line: line)
    }

    public static func info(_ message: Any? = nil, file: String = #file, function: String = #function, line: Int = #line) {
        printLog(style: .info, message: message, file: file, function: function, line: line)
    }

    public static func trace(_ message: Any? = nil, file: String = #file, function: String = #function, line: Int = #line) {
        printLog(style: .trace, message: message, file: file, function: function, line: line)
    }
    
    public static func modifier(_ message: Any? = nil, file: String = #file, function: String = #function, line: Int = #line) {
        printLog(style: .modifier, message: message, file: file, function: function, line: line)
    }
    
    enum LogStyle: String {
        case debug, warining, error, info, trace, modifier
    }
    
    static func printLog(style: LogStyle, message: Any? = nil, file: String = #file, function: String = #function, line: Int = #line) {
        #if DEBUG
        let fileName = (file as NSString).lastPathComponent.components(separatedBy: ".").first ?? file
        let method = "\(fileName).\(function)"
        switch style {
        case .debug, .warining, .error, .info, .trace:
            if let message = message {
                print("\(method):\(line) \(style.rawValue.uppercased()) -> \(message)")
            } else {
                print("\(method):\(line) \(style.rawValue.uppercased()) -> ")
            }
        case .modifier:
            if let message = message {
                print("\(method):\(line) -> =========== \(message) ===========")
            } else {
                print("\(method):\(line) -> ======================")
            }
        }
        #endif
    }
}
