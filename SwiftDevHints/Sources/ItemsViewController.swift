//
//  ItemsViewController.swift
//  SwiftDevHints
//
//  Created by ZHOU DENGFENG on 3/8/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import UIKit

public class ItemsViewController<Item, Cell: UITableViewCell>: UITableViewController {

    private var items: [Item] = []
    private let reuseIdentifier = "ItemCell"
    private var configure: (Cell, Item) -> ()
    public var didSelect: (Item) -> () = { _ in }
    
    public init(items: [Item], configure: @escaping (Cell, Item) -> ()) {
        self.configure = configure
        super.init(style: .plain)
        self.items = items
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(Cell.self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! Cell
        
        let item = items[indexPath.row]
        configure(cell, item)
        
        return cell
    }
    
    override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        didSelect(item)
    }
}
