//
//  Result.swift
//  SwiftDevHints
//
//  Created by ZHOU DENGFENG on 4/8/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import Foundation

public enum Result<A> {
    case success(A)
    case failure(Error)
}

extension Result {
    public init(_ value: A?, or error: Error) {
        if let value = value {
            self = .success(value)
        } else {
            self = .failure(error)
        }
    }
    
    public init(value: () throws -> A) {
        do {
            self = try .success(value())
        } catch {
            self = .failure(error)
        }
    }
}

extension Result {
    public var value: A? {
        switch self {
        case .success(let value):
            return value
        case .failure:
            return nil
        }
    }
    
    public var error: Error? {
        switch self {
        case .success:
            return nil
        case .failure(let error):
            return error
        }
    }
    
    public var isSuccess: Bool {
        switch self {
        case .success:
            return true
        case .failure:
        return false
        }
    }
    
    public var isFailure: Bool {
        return !isSuccess
    }
}

extension Result: CustomStringConvertible {
    public var description: String {
        switch self {
        case .success:
            return "SUCCESS"
        case .failure:
            return "FAILURE"
        }
    }
}

extension Result: CustomDebugStringConvertible {
    public var debugDescription: String {
        switch self {
        case .success(let value):
            return "SUCCESS: \(value)"
        case .failure(let error):
            return "FAILURE: \(error)"
        }
    }
}

extension Result {
    public func map<T>(_ transform: (A) -> T) -> Result<T> {
        switch self {
        case .success(let value):
            return .success(transform(value))
        case .failure(let error):
            return .failure(error)
        }
    }
    
    public func flatMap<T>(_ transform: (A) throws -> T) -> Result<T> {
        switch self {
        case .success(let value):
            do {
                return try .success(transform(value))
            } catch {
                return .failure(error)
            }
        case .failure(let error):
            return .failure(error)
        }
    }
}


