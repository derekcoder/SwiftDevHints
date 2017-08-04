//
//  CoreDataStack.swift
//  SwiftDevHints
//
//  Created by ZHOU DENGFENG on 4/8/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import CoreData

@available(iOS 10.0, *)
public func createContainer(with name: String, completion: @escaping (NSPersistentContainer) -> ()) {
    let container = NSPersistentContainer(name: name)
    container.loadPersistentStores { _, error in
        guard error == nil else {
            fatalError("Failed to load container.")
        }
        
        DispatchQueue.main.async {
            completion(container)
        }
    }
}
