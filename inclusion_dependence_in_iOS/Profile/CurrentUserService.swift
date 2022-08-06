//
//  CurrentUserService.swift
//  Navigation_2
//
//  Created by Ibragim Assaibuldayev on 10.05.2022.
//

import Foundation

class CurrentUserService: UserService {
    
    let currentUser = User(name: "Ibragim", avatar: "", status: "")
    
    func userNick(name: String) -> String {
        let user = User(name: name, avatar: "", status: "")
        if user.name == currentUser.name {
            return currentUser.name
        } else {
            return "the username is wrong!"
        }
    }
}
