//
//  UITableViewExtensions.swift
//  SwiftDevHints
//
//  Created by Derek on 17/9/18.
//  Copyright © 2018 ZHOU DENGFENG DEREK. All rights reserved.
//

import Foundation

// Reference from https://github.com/andyyhope/nemo

extension UITableView {
    public func register<T: UITableViewCell>(_: T.Type) where T: NibLoadable {
        register(T.nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    public func register<T: UITableViewCell>(_: T.Type) {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    public func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("The \(String(describing: T.self)) couldn't be dequeued.")
        }
        return cell
    }
}
