//
//  UIViewControllerExtensions.swift
//  Photos
//
//  Created by ZHOU DENGFENG on 5/8/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

#if os(iOS)
import UIKit

public enum AlertControllerStyle {
    case alert
    case actionSheetFromView(UIView)
    case actionSheetFromBarButtonItem(UIBarButtonItem)
}

public extension UIViewController {
    func alertController(title: String? = nil, message: String? = nil, actions: [UIAlertAction], style: UIAlertController.Style) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        actions.forEach { alert.addAction($0) }
        return alert
    }
    
    func showAlert(title: String? = nil, message: String? = nil, actions: [UIAlertAction], style: AlertControllerStyle) {
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

public extension UIViewController {
    func removeChildVC(_ child: UIViewController?) {
        child?.willMove(toParent: nil)
        child?.view.removeFromSuperview()
        child?.removeFromParent()
    }
    
    func addChildVC(_ child: UIViewController?, containerView: UIView) {
        guard let child = child else { return }
        addChild(child)
        containerView.addSubview(child.view)
        child.didMove(toParent: self)
        
        child.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.view.topAnchor.constraint(equalTo: containerView.topAnchor),
            child.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            child.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            child.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
        ])
    }
}
#endif
