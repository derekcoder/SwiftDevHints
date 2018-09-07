//
//  UserDefaultsExtensionsViewController.swift
//  SwiftDevHints-Demo
//
//  Created by ZHOU DENGFENG on 2/8/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import UIKit
import SwiftDevHints

extension UserDefaults.Name {
 	static let Username: UserDefaults.Name = "SwiftDevHints-Demo.Username"
    static let Password: UserDefaults.Name = "SwiftDevHints-Demo.Password"
}

class UserDefaultsExtensionsViewController: UIViewController {

    let username = "Derek"
    let password = "Password"
    
    @IBAction func saveData() {
        UserDefaults.standard.set(username, forName: .Username)
        UserDefaults.standard.set(password, forName: .Password)
    }
    
    @IBAction func getData() {
        Log.debug(UserDefaults.standard.string(forName: .Username))
        Log.debug(UserDefaults.standard.string(forName: .Password))
    }
}
