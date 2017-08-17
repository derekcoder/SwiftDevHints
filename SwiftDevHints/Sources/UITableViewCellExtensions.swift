//
//  UITableViewCellExtensions.swift
//  SwiftDevHints
//
//  Created by ZHOU DENGFENG on 15/7/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import UIKit

protocol CellIdentifierProtocol: AnyObject {
    static var cellIdentifier: String { get }
}

extension UITableViewCell: CellIdentifierProtocol {
    public static var cellIdentifier: String {
        let className = String(describing: self)
        return className
    }
    
    public func nibRegister(tableView: UITableView) {
        let identifier = type(of: self).cellIdentifier
        let nib = UINib(nibName: identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: identifier)
    }
}

public func registerNibForCellWithIdentifier(_ identifier: String, tableView: UITableView) {
    let nib = UINib(nibName: identifier, bundle: nil)
    tableView.register(nib, forCellReuseIdentifier: identifier)
}
