//
//  DemoTableViewController.swift
//  SwiftDevHints-Demo
//
//  Created by Julie on 3/8/17.
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
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class DemoTableViewController: UITableViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 && indexPath.row == 0 {
            let categories = [Category(title: "Computers"), Category(title: "Electronics")]
            let products = [Product(title: "iMac", serialNumber: "P-0001"), Product(title: "iPad", serialNumber: "P-0002"), Product(title: "iPhone", serialNumber: "P-0003")]
            
            let nc = navigationController!
            
            let categoriesVC = ItemsViewController(items: categories, configure: { (cell, category) in
                cell.textLabel?.text = category.title
            })
            categoriesVC.title = "Categories"
            categoriesVC.didSelect = { category in
                let productsVC = ItemsViewController(items: products, configure: { (cell: ProductCell, product) in
                    cell.textLabel?.text = product.title
                    cell.detailTextLabel?.text = product.serialNumber
                })
                productsVC.title = category.title
                nc.pushViewController(productsVC, animated: true)
            }
    
            nc.pushViewController(categoriesVC, animated: true)
        }
    }
}
