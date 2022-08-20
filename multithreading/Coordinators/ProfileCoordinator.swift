//
//  ProfileCoordinator.swift
//  Navigation_2
//
//  Created by Ibragim Assaibuldayev on 03.08.2022.
//


import UIKit

class ProfileCoordinator: Coordinator {
    
    var navigation: UINavigationController
    
    weak var parentCoordinator: LoginCoordinator?
    
    var childCoordinators: [Coordinator] = []
    
    var userName: String
    
    var userService: UserService
    
    func start() {
        let profileController = TypeOfViewControllerFactory.makeViewController(.profile(profileView: ProfileModel(userName: userName, userService: userService)))
        navigation.pushViewController(profileController(), animated: true)
    }
        
    init(navigation: UINavigationController, userName: String, userService: UserService) {
        self.navigation = navigation
        self.userName = userName
        self.userService = userService
    }
    
    func photosSubscription() {
        print("photosSubscription work")
        let child = PhotosCoordinator(navigation: navigation)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
}
