//
//  UserDefaultsExtensionsViewController.swift
//  SwiftDevHints-Demo
//
//  Created by Julie on 2/8/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import UIKit
import SwiftDevHints

extension UserDefaults.Name {
 	static let Username: UserDefaults.Name = UserDefaults.Name("SwiftDevHints-Demo.Username")
    static let Password: UserDefaults.Name = UserDefaults.Name("SwiftDevHints-Demo.Password")
}

class UserDefaultsExtensionsViewController: UIViewController {

    let username = "Derek"
    let password = "Password"
    
    @IBAction func saveData() {
        UserDefaults.standard.set(username, forName: .Username)
        UserDefaults.standard.set(password, forName: .Password)
    }
    
    @IBAction func getData() {
        printLog(UserDefaults.standard.string(forName: .Username))
        printLog(UserDefaults.standard.string(forName: .Password))
    }
}
