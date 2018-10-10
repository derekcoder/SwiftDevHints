//
//  UIViewControllerExtensions.swift
//  Photos
//
//  Created by ZHOU DENGFENG on 5/8/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import UIKit

public enum AlertControllerStyle {
    case alert
    case actionSheetFromView(UIView)
    case actionSheetFromBarButtonItem(UIBarButtonItem)
}

extension UIViewController {    
    public func alertController(title: String? = nil, message: String? = nil, actions: [UIAlertAction], style: UIAlertController.Style) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        actions.forEach { alert.addAction($0) }
        return alert
    }
    
    public func showAlert(title: String? = nil, message: String? = nil, actions: [UIAlertAction], style: AlertControllerStyle) {
        switch style {
        case .alert:
            let alert = alertController(title: title, message: message, actions: actions, style: .alert)
            present(alert, animated: true, completion: nil)
        case .actionSheetFromView(let view):
            let alert = alertController(title: title, message: message, actions: actions, style: .actionSheet)
            if let popover = alert.popoverPresentationController {
                popover.sourceView = view
                popover.sourceRect = view.bounds
            }
            present(alert, animated: true, completion: nil)
        case .actionSheetFromBarButtonItem(let barButtonItem):
            let alert = alertController(title: title, message: message, actions: actions, style: .actionSheet)
            if let popover = alert.popoverPresentationController {
                popover.barButtonItem = barButtonItem
            }
            present(alert, animated: true, completion: nil)
        }
    }
}
