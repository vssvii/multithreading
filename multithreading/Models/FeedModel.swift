//
//  FeedModel.swift
//  Navigation_2
//
//  Created by Ibragim Assaibuldayev on 05.08.2022.
//

import UIKit

class FeedModel {
    
    var onTap: (() -> Void)?
    
    let password: String = "Пароль"
    
    func check(word: String) {
        onTap?()
    }
}
