//
//  UIImageFilterViewController.swift
//  SwiftDevHints-Demo
//
//  Created by ZHOU DENGFENG on 15/9/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import UIKit
import SwiftDevHints

class UIImageFilterViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    var image: UIImage = #imageLiteral(resourceName: "sample")
    
    @IBAction func showOrigin() {
        imageView.image = image
    }

    @IBAction func applyVignetteFilter() {
        imageView.image = image.applyFilterWithName(.vignette)
    }
	
    @IBAction func applySepiaFilter() {
        imageView.image = image.applyFilterWithName(.sepia)
    }

    @IBAction func applyNoirFilter() {
        imageView.image = image.applyFilterWithName(.noir)
    }

    @IBAction func applyInstantPhotoFilter() {
        imageView.image = image.applyFilterWithName(.instantPhoto)
    }

    @IBAction func applyChromePhotoFilter() {
        imageView.image = image.applyFilterWithName(.chromePhoto)
    }
}
