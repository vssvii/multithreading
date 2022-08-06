//
//  Checker.swift
//  Navigation_2
//
//  Created by Ibragim Assaibuldayev on 20.05.2022.
//

import Foundation
import UIKit

final class Checker {
    
    static var shared = Checker()
    
    private let loginChecker = "Ibragim"
    private let pswdChecker = "Ibragim123"
    
    private init() {
        
    }
    
    func checkAuth(login: String, password: String) -> Bool {
        if login == loginChecker && password == pswdChecker {
            return true
        } else {
            return false
        }
    }
}
