//
//  StackViewController.swift
//  SwiftDevHints
//
//  Created by ZHOU DENGFENG on 4/8/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import UIKit

public final class CallbackButton: UIView {
    let onTap: () -> ()
    let button: UIButton
    
    public init(title: String, onTap: @escaping () -> ()) {
        self.onTap = onTap
        self.button = UIButton(type: .system)
        super.init(frame: .zero)
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.constraint(edgesTo: self)
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: #selector(self.tapped(_:)), for: .touchUpInside)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapped(_ sender: Any) {
        onTap()
    }
}

public enum ContentElement {
    case label(String)
    case button(String, () -> ())
    case image(UIImage)
    
    var view: UIView {
        switch self {
        case .label(let text):
            let label = UILabel()
            label.numberOfLines = 0
            label.text = text
            return label
        case .button(let title, let callback): // TODO: Tap Action
            return CallbackButton(title: title, onTap: callback)
        case .image(let image):
            return UIImageView(image: image)
        }
    }
}

public extension UIStackView {
    convenience init(elements: [ContentElement]) {
        self.init()
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        spacing = 10
        
        for element in elements {
            addArrangedSubview(element.view)
        }
    }
}

public final class StackViewController: UIViewController {
    let elements: [ContentElement]
    
    public init(elements: [ContentElement]) {
        self.elements = elements
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let stackView = UIStackView(elements: elements)
        view.addSubview(stackView)
        stackView.constraint(equalTo: view, attribute: .width)
        stackView.center(in: view)
    }
}
