//
//  CurrentUserService.swift
//  Navigation_2
//
//  Created by Ibragim Assaibuldayev on 10.05.2022.
//

import Foundation

class CurrentUserService: UserService {
    
    
    var user: User
    
    init(user: User) {
        self.user = user
    }
    
    
    func sendUser(name: String) -> User? {
        if user.name == name {
            return user
        } else {
            return nil
        }
    }
}
