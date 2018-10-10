//
//  NotificationDescriptorViewController.swift
//  SwiftDevHints-Demo
//
//  Created by Derek on 1/2/18.
//  Copyright © 2018 ZHOU DENGFENG DEREK. All rights reserved.
//

import UIKit
import SwiftDevHints

struct KeyboardWillShowNotification: NotificationDescriptor {
    let beginFrame: CGRect
    let endFrame: CGRect
    let animationDuration: Double
    let animationCurve: UIView.AnimationCurve
    
    static let name = UIWindow.keyboardWillShowNotification
    init(notification: Notification) {
        beginFrame = notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey] as! CGRect
        endFrame = notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        animationDuration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        animationCurve = UIView.AnimationCurve(rawValue: notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! Int)!
    }
}

struct KeyboardDidHideNotification: NotificationDescriptor {
    let beginFrame: CGRect
    let endFrame: CGRect
    let animationDuration: Double
    let animationCurve: UIView.AnimationCurve
    
    static let name = UIWindow.keyboardDidHideNotification
    init(notification: Notification) {
        beginFrame = notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey] as! CGRect
        endFrame = notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        animationDuration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        animationCurve = UIView.AnimationCurve(rawValue: notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! Int)!
    }
}

class NotificationDescriptorViewController: UIViewController {
    private var willShowKeyboardToken : Token?
    private var didHideKeyboardToken : Token?
    @IBOutlet weak var beginFrameLabel: UILabel!
    @IBOutlet weak var endFrameLabel: UILabel!
    @IBOutlet weak var animationDurationLabel: UILabel!
    @IBOutlet weak var animationCurveLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        willShowKeyboardToken = NotificationCenter.default.addObserver { (note: KeyboardWillShowNotification) in
            print(note)
            self.beginFrameLabel.text = "\(note.beginFrame)"
            self.endFrameLabel.text = "\(note.endFrame)"
            self.animationDurationLabel.text = "\(note.animationDuration)"
            self.animationCurveLabel.text = "\(note.animationCurve.rawValue)"
        }
        
        didHideKeyboardToken = NotificationCenter.default.addObserver { (note: KeyboardDidHideNotification) in
            print(note)
            self.beginFrameLabel.text = "\(note.beginFrame)"
            self.endFrameLabel.text = "\(note.endFrame)"
            self.animationDurationLabel.text = "\(note.animationDuration)"
            self.animationCurveLabel.text = "\(note.animationCurve.rawValue)"
        }
    }
}

extension NotificationDescriptorViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
