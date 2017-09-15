//
//  CircularImageView.swift
//  SwiftDevHints
//
//  Created by ZHOU DENGFENG on 15/9/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import UIKit

@IBDesignable
public class CircularImageView: UIView {

    @IBInspectable
    public var image: UIImage? {
        didSet {
            refreshImage()
        }
    }
    
    @IBInspectable
    public var saturation: CGFloat = 1.0 {
        didSet {
            refreshImage()
        }
    }
    
    private var imageView: UIImageView = UIImageView(frame: .zero)
    
    public override func prepareForInterfaceBuilder() {
        if image == nil {
            image = UIImage(named: "CircularImageView-Default", in: Bundle(for: CircularImageView.self), compatibleWith: nil)
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
		setUp()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    private func setUp() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.constraint(edgesTo: self)
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func refreshImage() {
        if let image = image {
            imageView.image = prepareImage(source: image, saturation: saturation)
            backgroundColor = nil
        } else {
            imageView.image = nil
            backgroundColor = .white
        }
    }
    
    private func imageByDrawing(size: CGSize, scale: CGFloat, closure: () -> ()) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        closure()
        let result = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return result
    }
    
    private func prepareImage(source: UIImage, saturation: CGFloat = 1) -> UIImage {
        let size = source.size
        let magnitude = min(size.width, size.height)
        let bounds = CGRect(x: 0, y: 0, width: magnitude, height: magnitude)

        return imageByDrawing(size: bounds.size, scale: source.scale) {
            UIBezierPath(ovalIn: bounds).addClip()
            source.draw(at: CGPoint(x: (magnitude - source.size.width) / 2, y: (magnitude - source.size.height) / 2))
            UIColor(white: 1.0, alpha: 1.0 - saturation).set()
            UIRectFillUsingBlendMode(bounds, .color)
        }
    }
}
