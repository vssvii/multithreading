//
//  LoginViewControllerDelegate.swift
//  Navigation_2
//
//  Created by Ibragim Assaibuldayev on 20.05.2022.
//

import Foundation
import UIKit

protocol LoginViewControllerDelegate {
    
    func logInPasswordChecker(login: String, password: String) -> Bool

}
