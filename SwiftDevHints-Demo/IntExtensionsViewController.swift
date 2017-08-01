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
            let range = Range<Int>(1...100)
            let randomInt = Int.random(range)
            printLog(randomInt)
        }
    }
    
    @IBAction func formatInt() {
        let aInt = 8
        let formatedInt1 = aInt.format("03") // "003"
        let formatedInt2 = aInt.format("3") // "  3"
        printLog(formatedInt1)
        printLog(formatedInt2)
    }
}

