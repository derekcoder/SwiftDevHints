//
//  UITableViewExtensions.swift
//  SwiftDevHints
//
//  Created by Derek on 17/9/18.
//  Copyright © 2018 ZHOU DENGFENG DEREK. All rights reserved.
//
//  Reference
//  * [AliSoftware/Reusable](https://github.com/AliSoftware/Reusable)
//  * [andyyhope/nemo](https://github.com/andyyhope/nemo)

#if os(iOS)
import UIKit

public extension UITableView {
    final func register<T: UITableViewCell>(_ cellType: T.Type) where T: NibReusable {
        register(cellType.nib, forCellReuseIdentifier: cellType.reuseIdentifier)
    }
    
    final func register<T: UITableViewCell>(_ cellType: T.Type) where T: Reusable {
        register(cellType.self, forCellReuseIdentifier: cellType.reuseIdentifier)
    }
    
    final func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath, cellType: T.Type = T.self) -> T where T: Reusable {
        guard let cell = dequeueReusableCell(withIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
            fatalError("The \(String(describing: T.self)) couldn't be dequeued.")
        }
        return cell
    }
}

public extension UITableView {
    final func register<T: UITableViewHeaderFooterView>(_ cellType: T.Type) where T: NibReusable {
        register(cellType.nib, forHeaderFooterViewReuseIdentifier: cellType.reuseIdentifier)
    }
    
    final func register<T: UITableViewHeaderFooterView>(_ cellType: T.Type) where T: Reusable {
        register(cellType.self, forHeaderFooterViewReuseIdentifier: cellType.reuseIdentifier)
    }
    
    final func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(cellType: T.Type = T.self) -> T where T: Reusable {
        guard let headerFooterView = dequeueReusableHeaderFooterView(withIdentifier: cellType.reuseIdentifier) as? T else {
            fatalError("The \(String(describing: T.self)) couldn't be dequeued.")
        }
        return headerFooterView
    }
}
#endif
