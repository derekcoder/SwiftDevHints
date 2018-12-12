//
//  UICollectionView+NibReusable.swift
//  SwiftDevHints
//
//  Created by Derek on 12/12/18.
//  Copyright © 2018 ZHOU DENGFENG DEREK. All rights reserved.
//
//  Reference
//  * [AliSoftware/Reusable](https://github.com/AliSoftware/Reusable)
//  * [andyyhope/nemo](https://github.com/andyyhope/nemo)

import UIKit


public extension UICollectionView {
    final func register<T: UICollectionViewCell>(_ cellType: T.Type) where T: NibReusable {
        register(cellType.nib, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }
    
    final func register<T: UICollectionViewCell>(_ cellType: T.Type) where T: Reusable {
        register(cellType.self, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }
    
    final func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath, cellType: T.Type = T.self) -> T where T: Reusable {
        guard let cell = dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
            fatalError("The \(String(describing: T.self)) couldn't be dequeued.")
        }
        return cell
    }
}
