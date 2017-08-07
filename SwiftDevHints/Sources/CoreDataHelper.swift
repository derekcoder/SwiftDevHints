//
//  NSManagedObjectExtensions.swift
//  Photos
//
//  Created by ZHOU DENGFENG on 5/8/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import Foundation
import CoreData

public func create<T: NSManagedObject>(into moc: NSManagedObjectContext) -> T {
    let entityName = T.entity().name!
    let result = NSEntityDescription.insertNewObject(forEntityName: entityName, into: moc)
    return result as! T
}

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
