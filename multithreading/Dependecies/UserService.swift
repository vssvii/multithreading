//
//  UserService.swift
//  Navigation_2
//
//  Created by Ibragim Assaibuldayev on 10.05.2022.
//

import Foundation

protocol UserService {
    
    func sendUser(name: String) -> User?
}

