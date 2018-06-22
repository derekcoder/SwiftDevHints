//
//  NSPredicateExtension.swift
//  SwiftDevHints
//
//  Created by Derek on 22/6/18.
//  Copyright © 2018 ZHOU DENGFENG DEREK. All rights reserved.
//

import Foundation

public extension NSPredicate {
    public func andPredicate(_ p: NSPredicate) -> NSPredicate {
        return NSCompoundPredicate(andPredicateWithSubpredicates: [self, p])
    }
}
