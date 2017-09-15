//
//  UIStoryboardSegue.swift
//  Photos
//
//  Created by ZHOU DENGFENG on 5/8/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import UIKit

extension UIStoryboardSegue {
    public var customSegue: CustomSegue {
        return CustomSegue(identifier ?? "")
    }
}
