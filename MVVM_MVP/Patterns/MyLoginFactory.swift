//
//  MyLoginFactory.swift
//  Navigation_2
//
//  Created by Ibragim Assaibuldayev on 06.08.2022.
//

import Foundation


class MyLoginFactory: LoginFactory {
    func getLoginInspector() -> LoginInspector {
        return LoginInspector()
    }
}
