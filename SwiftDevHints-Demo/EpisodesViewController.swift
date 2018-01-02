//
//  EpisodesViewController.swift
//  SwiftDevHints-Demo
//
//  Created by Derek on 28/12/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import UIKit
import SwiftDevHints

struct Episode {
    let id: String
    let title: String
}

extension Episode {
    init?(dictionary: JSONDictionary) {
        guard let id = dictionary["id"] as? String,
            let title = dictionary["title"] as? String else { return nil }
        self.id = id
        self.title = title
    }
}

let url = URL(string: "https://talk.objc.io/episodes.json")!

extension Episode {
    static let all = try! Resource<[Episode]>(url: url, parseElement: Episode.init)
}

class EpisodesViewController: UITableViewController {
    private var episodes: [Episode] = []
    private let webservice = Webservice()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webservice.load(Episode.all) { [weak self] result in
            if let value = result.value {
                self?.episodes = value
            }
            self?.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        let episode = episodes[indexPath.row]
        cell.textLabel?.text = episode.title
        cell.detailTextLabel?.text = episode.id
        
        return cell
    }
}












