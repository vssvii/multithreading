//
//  LoginInspector.swift
//  Navigation_2
//
//  Created by Ibragim Assaibuldayev on 06.08.2022.
//

import Foundation


class LoginInspector: LoginViewControllerDelegate {
    func logInPasswordChecker(login: String, password: String) -> Bool {
        Checker.shared.checkAuth(login: login, password: password)
    }
}
