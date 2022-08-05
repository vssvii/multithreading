//
//  ProfileModel.swift
//  Navigation_2
//
//  Created by Ibragim Assaibuldayev on 05.08.2022.
//

import UIKit

class ProfileModel {

    let title: String = "Профиль"
    var color: UIColor = .white
    var userService: UserService
    var userName: String
    var user: User
    
    init(userName: String, userService: UserService) {
        self.userName = userName
        self.userService = userService
        self.user = User(name: userName, avatar: "profile", status: "Жизнь прекрасна!")
    }
}
