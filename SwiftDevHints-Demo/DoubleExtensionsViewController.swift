//
//  DoubleExtensionsViewController.swift
//  SwiftDevHints-Demo
//
//  Created by Julie on 1/8/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import UIKit
import SwiftDevHints

class DoubleExtensionsViewController: UIViewController {

    @IBAction func formatDouble() {
        let aDouble = 3.14159265
        let formatedDouble1 = aDouble.format(".2") // "3.14"
        let formatedDouble2 = aDouble.format(".3") // "3.142"
        printLog(formatedDouble1)
        printLog(formatedDouble2)
    }
    
    @IBAction func roundDouble() {
        let aDouble = 3.14159265
        let roundedDouble1 = aDouble.roundTo(places: 2) // 3.14
        let roundedDouble2 = aDouble.roundTo(places: 3) // 3.142
		printLog(roundedDouble1)
        printLog(roundedDouble2)
    }
}
