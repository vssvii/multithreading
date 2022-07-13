//
//  CustomButton.swift
//  Navigation_2
//
//  Created by Ibragim Assaibuldayev on 10.07.2022.
//

import Foundation
import UIKit

class CustomButton: UIView {
    
    var onTap: (() -> Void)?
    
    lazy var customButton: UIButton = {
        let customButton = UIButton()
        customButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return customButton
    }()
    
    required init(backgroundColor: UIColor, title: String, shadowHeight: CGFloat, shadowWidth: CGFloat, shadowRadius: CGFloat, shadowColor: CGColor, shadowOpacity: Float) {
        super.init(frame: .zero)
        self.customButton.backgroundColor = backgroundColor
        self.customButton.setTitle(title, for: .normal)
        self.customButton.layer.shadowOffset = CGSize(width: shadowWidth, height: shadowHeight)
        self.customButton.layer.shadowRadius = shadowRadius
        self.customButton.layer.shadowColor = shadowColor
        self.customButton.layer.shadowOpacity = shadowOpacity
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(customButton)
        customButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            customButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            customButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            customButton.topAnchor.constraint(equalTo: self.topAnchor),
            customButton.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    @objc func buttonPressed() {
        onTap?()
    }
}
