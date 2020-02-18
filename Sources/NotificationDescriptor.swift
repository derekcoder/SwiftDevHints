//
//  NotificationDescriptor.swift
//  SwiftDevHints
//
//  Created by Derek on 1/2/18.
//  Copyright © 2018 ZHOU DENGFENG DEREK. All rights reserved.
//

import Foundation

public protocol NotificationDescriptor {
    static var name: Notification.Name { get }
    init(notification: Notification)
}

public final class Token {
    let token: NSObjectProtocol
    let center: NotificationCenter
    
    fileprivate init(token: NSObjectProtocol, center: NotificationCenter) {
        self.token = token
        self.center = center
    }
    
    deinit {
        center.removeObserver(token)
    }
}

extension NotificationCenter {
    public func addObserver<Note: NotificationDescriptor>(queue: OperationQueue? = nil, using block: @escaping (Note) -> ()) -> Token {
        let token = addObserver(forName: Note.name, object: nil, queue: queue, using: { note in
            block(Note(notification: note))
        })
        return Token(token: token, center: self)
    }
}
