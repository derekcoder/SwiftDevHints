//
//  DoubleExtensionsViewController.swift
//  SwiftDevHints-Demo
//
//  Created by ZHOU DENGFENG on 1/8/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import UIKit
import SwiftDevHints

class DoubleExtensionsViewController: UIViewController {

    @IBAction func formatDouble() {
        let positiveDouble = 3.14159265
        let negativeDouble = -3.14159265
        let aString1 = positiveDouble.format(".2") // "3.14"
        let aString2 = positiveDouble.format(".3") // "3.142"
        let aString3 = negativeDouble.format(".2") // "-3.14"
        let aString4 = negativeDouble.format(".3") // "-3.142"
        debugPrintLog(aString1)
        debugPrintLog(aString2)
        debugPrintLog(aString3)
        debugPrintLog(aString4)
    }
    
    @IBAction func roundDouble() {
        let aDouble = 3.14159265
        let roundedDouble1 = aDouble.roundTo(places: 2) // 3.14
        let roundedDouble2 = aDouble.roundTo(places: 3) // 3.142
		debugPrintLog(roundedDouble1)
        debugPrintLog(roundedDouble2)
    }
}
