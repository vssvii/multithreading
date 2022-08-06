//
//  TestUserService.swift
//  Navigation_2
//
//  Created by Ibragim Assaibuldayev on 11.05.2022.
//

import UIKit

class TestUserService: UserService {
    
    
    private let user = User(name: "Ibragim Assaibuldayev", avatar: "profile", status: "Life is beautiful.")
    
    
    func sendUser(name: String) -> User? {
        return user
    }
}
