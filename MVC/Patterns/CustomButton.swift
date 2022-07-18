//
//  CustomButton.swift
//  Navigation_2
//
//  Created by Ibragim Assaibuldayev on 10.07.2022.
//

import Foundation
import UIKit

final class CustomButton: UIButton {
    typealias Action = () -> Void
    
    var buttonAction: Action
    
    init(title: String, titleColor: UIColor = .white, bgColor: UIColor = UIColor(named: "colorHex")!, action: @escaping Action) {
        buttonAction = action
        super.init(frame: .zero)
        layer.cornerRadius = 12
        clipsToBounds = true
        backgroundColor = bgColor
        setTitleColor(titleColor, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
        setTitle(title, for: .normal)
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error!")
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        buttonAction()
    }
}
