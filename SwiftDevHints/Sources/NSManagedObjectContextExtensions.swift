//
//  NSManagedObjectContextExtensions.swift
//  Photos
//
//  Created by Julie on 7/8/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import Foundation
import CoreData

extension NSManagedObjectContext {
    @discardableResult public func saveOrRollback() -> Bool {
        do {
            try save()
            return true
        } catch {
            rollback()
            return false
        }
    }
}
