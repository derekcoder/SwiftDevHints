//
//  UITableViewCell+NibLoadable.swift
//  SwiftDevHints
//
//  Created by Derek on 12/12/18.
//  Copyright © 2018 ZHOU DENGFENG DEREK. All rights reserved.
//
//  Reference
//  * [AliSoftware/Reusable](https://github.com/AliSoftware/Reusable)
//  * [andyyhope/nemo](https://github.com/andyyhope/nemo)

#if os(iOS)
import UIKit

public protocol NibLoadable: class {
    static var nib: UINib { get }
}

public extension NibLoadable {
    static var nib: UINib {
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
#endif
