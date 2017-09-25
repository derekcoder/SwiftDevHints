//
//  CustomSegueProtocol.swift
//  SwiftDevHints
//
//  Created by Julie on 25/9/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import UIKit

public protocol CustomSegueProtocol {
    associatedtype CustomSegueIdentifier: RawRepresentable
    
 	func performCustomSegue(_ segue: CustomSegueIdentifier, sender: Any?)
 	func customSegueIdentifier(forSegue segue: UIStoryboardSegue) -> CustomSegueIdentifier
}

extension CustomSegueProtocol where Self: UIViewController, CustomSegueIdentifier.RawValue == String {
    public func performCustomSegue(_ segue: CustomSegueIdentifier, sender: Any?) {
        performSegue(withIdentifier: segue.rawValue, sender: sender)
    }
    
    public func customSegueIdentifier(forSegue segue: UIStoryboardSegue) -> CustomSegueIdentifier {
        guard let identifier = segue.identifier,
            let customSegueIndentifier = CustomSegueIdentifier(rawValue: identifier) else {
                fatalError("Cannot get custom segue indetifier for segue: \(segue.identifier ?? "").")
        }
        
        return customSegueIndentifier
    }
}
