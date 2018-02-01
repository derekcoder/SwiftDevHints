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
    let animationCurve: UIViewAnimationCurve
    
    static let name = Notification.Name.UIKeyboardWillShow
    init(notification: Notification) {
        beginFrame = notification.userInfo![UIKeyboardFrameBeginUserInfoKey] as! CGRect
        endFrame = notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! CGRect
        animationDuration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double
        animationCurve = UIViewAnimationCurve(rawValue: notification.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! Int)!
    }
}

struct KeyboardDidHideNotification: NotificationDescriptor {
    let beginFrame: CGRect
    let endFrame: CGRect
    let animationDuration: Double
    let animationCurve: UIViewAnimationCurve
    
    static let name = Notification.Name.UIKeyboardDidHide
    init(notification: Notification) {
        beginFrame = notification.userInfo![UIKeyboardFrameBeginUserInfoKey] as! CGRect
        endFrame = notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! CGRect
        animationDuration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double
        animationCurve = UIViewAnimationCurve(rawValue: notification.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! Int)!
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
