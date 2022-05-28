//
//  TestUserService.swift
//  Navigation_2
//
//  Created by Ibragim Assaibuldayev on 11.05.2022.
//

import UIKit

class TestUserService: UserService {
    
    let testUser = User(name: "Test", avatar: "", status: "")
    
    func userNick(name: String) -> String {
        let user = User(name: name, avatar: "", status: "")
        if user.name == testUser.name {
            return testUser.name
        } else {
            return "the username is wrong!"
        }
    }
}
