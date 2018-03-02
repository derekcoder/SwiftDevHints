//
//  CachedWebservice.swift
//  SwiftDevHints
//
//  Created by Derek on 2/1/18.
//  Copyright © 2018 ZHOU DENGFENG DEREK. All rights reserved.
//

// Referenced from https://talk.objc.io/

import Foundation

struct FileStorage {
    let baseURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    
    subscript(key: String) -> Data? {
        get {
            let url = baseURL.appendingPathComponent(key)
            return try? Data(contentsOf: url)
        }
        set {
            let url = baseURL.appendingPathComponent(key)
            if let data = newValue {
                _ = try? data.write(to: url)
            } else {
                try? FileManager.default.removeItem(at: url)
            }
        }
    }
}

extension Resource {
    var cacheKey: String {
        return "cache:" + SHA1.hexString(from: url.absoluteString)!
    }
}

final class Cache {
    var storage = FileStorage()
    
    func load<A>(resource: Resource<A>) -> A? {
        guard case .get = resource.method else { return nil }
        let data = storage[resource.cacheKey]
        return data.flatMap(resource.parse)
    }
    
    func save<A>(_ data: Data, for resource: Resource<A>) {
        guard case .get = resource.method else { return }
        storage[resource.cacheKey] = data
    }
}

public final class CachedWebservice {
    let webservice: Webservice
    let cache = Cache()
    
    public init(_ webservice: Webservice) {
        self.webservice = webservice
    }
    
    public func load<A>(_ resource: Resource<A>, skipCache: Bool = false, update: @escaping (Result<A>) -> ()) {
        let dataResource = Resource(url: resource.url, method: resource.method, parse: { $0 })

        if skipCache == false, let result = cache.load(resource: resource) {
            update(.success(result))
        }
        webservice.load(dataResource) { result in
            switch result {
            case .error(let error):
                update(.error(error))
            case .success(let data):
                self.cache.save(data, for: resource)
                update(Result(resource.parse(data), or: WebserviceError.other))
            }
        }
    }
}
