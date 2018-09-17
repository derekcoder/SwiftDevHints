//
//  UITableViewCellExtensions.swift
//  SwiftDevHints
//
//  Created by ZHOU DENGFENG on 15/7/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import UIKit

// Reference from https://github.com/andyyhope/nemo

public protocol NibLoadable: class {
    static var nib: UINib { get }
}

extension NibLoadable {
    public static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
}

extension NibLoadable where Self: UIView {
    public static func loadNib() -> Self {
        if let view = nib.instantiate(withOwner: nil, options: nil).first as? Self {
            return view
        } else {
            fatalError("The nib \(nib) expected its root view to be of type \(String(describing: self))")
        }
    }
}

public protocol Reusable: class {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: Reusable { }
