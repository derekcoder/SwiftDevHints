//
//  DemoTableViewController.swift
//  SwiftDevHints-Demo
//
//  Created by Julie on 3/8/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import UIKit
import SwiftDevHints

struct Season {
    var number: Int
    var title: String
}

struct Episode {
    var title: String
}

final class SeasonCell: UITableViewCell {
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
            let seasons = [Season(number: 1, title: "Season One"), Season(number: 2, title: "Season Two")]
            let episodes = [Episode(title: "First Episode"), Episode(title: "Second Episode"), Episode(title: "Third Episode")]
            
            let nc = navigationController!
            
            let seasonsVC = ItemsViewController(items: seasons, configure: { (cell: SeasonCell, season) in
                cell.textLabel?.text = season.title
                cell.detailTextLabel?.text = "\(season.number)"
            })
            seasonsVC.title = "Seasons"
            seasonsVC.didSelect = { season in
                let episodesVC = ItemsViewController(items: episodes, configure: { (cell, episode) in
                    cell.textLabel?.text = episode.title
                })
                episodesVC.title = season.title
                nc.pushViewController(episodesVC, animated: true)
            }
    
            nc.pushViewController(seasonsVC, animated: true)
        }
    }
}
