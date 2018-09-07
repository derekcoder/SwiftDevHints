//
//  IntExtensionsViewController.swift
//  SwiftDevHints-Demo
//
//  Created by ZHOU DENGFENG on 17/7/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import UIKit
import SwiftDevHints

class IntExtensionsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func generateRandomInt() {
        for _ in 0 ..< 20 {
            let randomInt = (1...100).randomInt
            Log.debug(randomInt)
        }
    }
    
    @IBAction func formatInt() {
        let aInt = 8
        let formatedInt1 = aInt.format("03") // "008"
        let formatedInt2 = aInt.format("3") // "  8"
        Log.debug(formatedInt1)
        Log.debug(formatedInt2)
    }
}

