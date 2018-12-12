//
//  DemoTableViewController.swift
//  SwiftDevHints-Demo
//
//  Created by ZHOU DENGFENG on 3/8/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import UIKit
import SwiftDevHints

struct Category {
    var title: String
}

struct Product {
    var title: String
    var serialNumber: String
}

final class ProductCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class DemoTableViewController: UITableViewController {
}
