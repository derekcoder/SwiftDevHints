//
//  ItemsViewController.swift
//  SwiftDevHints
//
//  Created by ZHOU DENGFENG on 3/8/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

// Referenced from https://talk.objc.io/

import UIKit

public class GenericTableViewController<Item, Cell: UITableViewCell>: UITableViewController {

    public var items: [Item] {
        didSet {
            tableView.reloadData()
        }
    }
    public var didSelect: (Item) -> () = { _ in }

    private let cellIdentifier = "CellIdentifier"
    private var configure: (Cell, Item) -> ()
    
    public init(style: UITableView.Style = .plain, items: [Item], configure: @escaping (Cell, Item) -> ()) {
        self.items = items
        self.configure = configure
        super.init(style: style)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(Cell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! Cell
        configure(cell, items[indexPath.row])
        return cell
    }
    
    override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        didSelect(item)
    }
}
