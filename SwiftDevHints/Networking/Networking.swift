//
//  Networking.swift
//  SwiftDevHints
//
//  Created by Julie on 4/8/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import Foundation

typealias JSONDictionary = [String: Any]

extension Sequence {
    public func failingFlatMap<T>(transform: (Self.Iterator.Element) throws -> T?) rethrows -> [T]? {
        var result: [T] = []
        for element in self {
            guard let transformed = try transform(element) else { return nil }
            result.append(transformed)
        }
        return result
    }
}

public enum HttpMethod<Body> {
    case get
    case post(Body)
}

extension HttpMethod {
    public var method: String {
        switch self {
        case .get: return "GET"
        case .post: return "POST"
        }
    }
    
    public func map<B>(_ f: (Body) -> B) -> HttpMethod<B> {
        switch self {
        case .get: return .get
        case .post(let body):
            return .post(f(body))
        }
    }
}

public struct Resource<A> {
    let url: URL
    let method: HttpMethod<Data>
    let parse: (Data) -> Result<A>
}

extension Resource {
    public init(url: URL, method: HttpMethod<Any> = .get, parseJSON: @escaping (Any) -> Result<A>) {
        self.url = url
        self.method = method.map { json in
            try! JSONSerialization.data(withJSONObject: json, options: []) // TODO: handle failure for json encoding
        }
        self.parse = { data in
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                return parseJSON(json)
            } catch {
                return .failure(NetworkingError.jsonDecodingFailed)
            }
        }
    }
}

extension URLRequest {
    public init<A>(resource: Resource<A>) {
        self.init(url: resource.url)
		httpMethod = resource.method.method
		if case let .post(data) = resource.method {
			httpBody = data
		}
	}
}

public final class Webservice {
    public init() { }
    
    public func load<A>(resource: Resource<A>, completion: @escaping (Result<A>) -> ()) {
    	let request = URLRequest(resource: resource)
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            var result: Result<A>
            if let error = error {
                result = .failure(error)
            } else {
                if let data = data {
                    result = resource.parse(data)
                } else {
                    result = .failure(NetworkingError.noData)
                }
            }
            
            DispatchQueue.main.async {
                completion(result)
            }
        }.resume()
    }
}
