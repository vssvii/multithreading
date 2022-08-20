//
//  PhotosCoordinator.swift
//  Navigation_2
//
//  Created by Ibragim Assaibuldayev on 05.08.2022.
//

import UIKit

class PhotosCoordinator: Coordinator {
    
    weak var parentCoordinator: ProfileCoordinator?
    
    var navigation: UINavigationController
        
    var childCoordinators: [Coordinator] = []
    
   func start() {
        let photosViewController = TypeOfViewControllerFactory.makeViewController(.photos)
        navigation.pushViewController(photosViewController(), animated: true)
    }
      
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
}
