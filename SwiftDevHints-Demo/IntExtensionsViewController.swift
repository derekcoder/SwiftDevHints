//
//  IntExtensionsViewController.swift
//  SwiftDevHints-Demo
//
//  Created by ZHOU DENGFENG on 17/7/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import UIKit
import SwiftDevHints

class IntExtensionsViewController: UITableViewController {
    
    private var randomInts = [Int]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func generateRandomInt() {
        randomInts.removeAll()
        for _ in 0 ..< 20 {
            let range = Range<Int>(1...100)
            randomInts.append(Int.random(range))
        }
        tableView.reloadData()
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return randomInts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        let randomInt = randomInts[indexPath.row]
        
        cell.textLabel?.text = "\(randomInt)"
        
        return cell
    }
}

