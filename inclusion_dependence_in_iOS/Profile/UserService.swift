//
//  UserService.swift
//  Navigation_2
//
//  Created by Ibragim Assaibuldayev on 10.05.2022.
//

import Foundation

protocol UserService {
}

extension UserService {
    
    func userNick(name: String) -> User {
        let user = User(name: name, avatar: "", status: "")
        return user
    }
}

