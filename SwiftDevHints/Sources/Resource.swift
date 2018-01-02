//
//  Resource.swift
//  SwiftDevHints
//
//  Created by Derek on 2/1/18.
//  Copyright © 2018 ZHOU DENGFENG DEREK. All rights reserved.
//

import Foundation

public enum HttpMethod<A> {
    case get
    case post(data: A)
    
    public var method: String {
        switch self {
        case .get: return "GET"
        case .post: return "POST"
        }
    }
    
    public func map<B>(f: (A) throws -> B) rethrows -> HttpMethod<B> {
        switch self {
        case .get: return .get
        case .post(let data): return .post(data: try f(data))
        }
    }
}

public struct Resource<A> {
    public var url: URL
    public var method: HttpMethod<Data> = .get
    public var parse: (Data) -> A?

    public init(url: URL, method: HttpMethod<Data> = .get, parse: @escaping (Data) -> A?) {
        self.url = url
        self.parse = parse
        self.method = method
    }
}

extension Resource {
    public init(url: URL, parseJSON: @escaping (Any) -> A?) {
        self.url = url
        self.method = .get
        self.parse = { data in
            let json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions())
            return json.flatMap(parseJSON)
        }
    }
    
    public init(url: URL, method: HttpMethod<Any>, parseJSON: @escaping (Any) -> A?) throws {
        self.url = url
        self.method = try method.map { jsonObject in
            try JSONSerialization.data(withJSONObject: jsonObject, options: JSONSerialization.WritingOptions())
        }
        self.parse = { data in
            let json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions())
            return json.flatMap(parseJSON)
        }
        
    }
}

extension Resource where A: RangeReplaceableCollection {
    public init(url: URL, method: HttpMethod<Any> = .get, parseElement: @escaping (JSONDictionary) -> A.Iterator.Element?) throws {
        self = try Resource(url: url, method: method, parseJSON: { json in
            guard let jsonDicts = json as? [JSONDictionary] else { return nil }
            let result = jsonDicts.flatMap(parseElement)
            return A(result)
        })
    }
}
