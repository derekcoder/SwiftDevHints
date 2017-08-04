//
//  UIViewExtensions.swift
//  SwiftDevHints
//
//  Created by ZHOU DENGFENG on 4/8/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import UIKit

extension UIView {
    
    public func constraint(equalTo to: Any?, toAttribute toAttr: NSLayoutAttribute,  attribute attr: NSLayoutAttribute, multiplier: CGFloat = 1, constant c: CGFloat = 0) {
        let constraint = NSLayoutConstraint(item: self, attribute: attr, relatedBy: .equal, toItem: to, attribute: toAttr, multiplier: multiplier, constant: c)
        NSLayoutConstraint.activate([constraint])
    }

    public func constraint(equalTo to: Any?, attribute attr: NSLayoutAttribute, multiplier: CGFloat = 1, constant c: CGFloat = 0) {
        constraint(equalTo: to, toAttribute: attr, attribute: attr, multiplier: multiplier, constant: c)
    }
    
    public func constraint(edgesToMarginOf view: UIView) {
        constraint(equalTo: view, toAttribute: .topMargin, attribute: .top)
        constraint(equalTo: view, toAttribute: .leadingMargin, attribute: .leading)
        constraint(equalTo: view, toAttribute: .trailingMargin, attribute: .trailing)
        constraint(equalTo: view, toAttribute: .bottomMargin, attribute: .bottom)
    }
    
    public func constraint(edgesTo view: UIView) {
        constraint(equalTo: view, attribute: .top)
        constraint(equalTo: view, attribute: .leading)
        constraint(equalTo: view, attribute: .trailing)
        constraint(equalTo: view, attribute: .bottom)
    }
    
    public func center(in view: UIView? = nil) {
        guard let container = view ?? self.superview else { fatalError("No super view for this view") }
        centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: container.centerYAnchor).isActive = true
    }
}

