//
//  UIImageExtensions.swift
//  SwiftDevHints
//
//  Created by ZHOU DENGFENG on 15/9/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import Foundation

extension UIImage {
    public enum FilterName: String {
        case vignette = "CIVignette"
        case sepia = "CISepiaTone"
        case noir = "CIPhotoEffectNoir"
        case instantPhoto = "CIPhotoEffectInstant"
        case chromePhoto = "CIPhotoEffectChrome"
        
        var filter: CIFilter? {
            let filter =  CIFilter(name: rawValue)
            switch self {
            case .vignette:
                filter?.setValue(2.0, forKey: "inputIntensity")
                filter?.setValue(0.8, forKey: "inputRadius")
            default: break
            }
            return filter
        }
    }
    
    public func applyFilterWithName(_ filterName: FilterName) -> UIImage? {
        guard let filter = filterName.filter else { return nil }
        return applyFilter(filter)
    }
    
    private func applyFilter(_ filter: CIFilter) -> UIImage? {
        let context = CIContext(options: nil)
        let inputCIImage = CIImage(cgImage: self.cgImage!)
        filter.setValue(inputCIImage, forKey: "inputImage")
        
        let outputCIImage = filter.outputImage!
        let outputCGImage = context.createCGImage(outputCIImage, from: outputCIImage.extent)!
        let filteredImage = UIImage(cgImage: outputCGImage)
        return filteredImage
    }
}
