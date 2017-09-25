//
//  UIViewControllerExtensions.swift
//  Photos
//
//  Created by ZHOU DENGFENG on 5/8/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import UIKit

extension UIViewController {
    public func showSimpleAlert(title: String?, message: String?) {
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        showCustomAlert(title: title, message: message, positiveAction: action)
    }
    
    public func showCustomAlert(title: String?, message: String?, positiveAction: UIAlertAction, negativeAction: UIAlertAction? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(positiveAction)
        if let action = negativeAction {
            alert.addAction(action)
        }
        present(alert, animated: true, completion: nil)
    }
}
