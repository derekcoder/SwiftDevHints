//
//  NSManagedObjectContext+Extensions.swift
//  SwiftDevHints
//
//  Created by derekcoder on 3/6/20.
//  Copyright © 2020 ZHOU DENGFENG DEREK. All rights reserved.
//

import Foundation
import CoreData

public extension NSManagedObjectContext {
  
  @discardableResult func saveIfNeeded() throws -> Bool {
    guard hasChanges else { return false }
    try save()
    return true
  }
}
