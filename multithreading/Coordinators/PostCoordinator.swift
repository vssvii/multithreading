//
//  PostCoordinator.swift
//  Navigation_2
//
//  Created by Ibragim Assaibuldayev on 05.08.2022.
//

import UIKit



class PostCoordinator: Coordinator {
    
    weak var parentCoordinator: FeedCoordinator?

    var navigation: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    func start() {
        print("vcPost start")
        let vcPost = PostViewController(.blue, title: "Новый пост")
        navigation.pushViewController(vcPost, animated: true)
    }
        
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func didFinishBuying() {
        parentCoordinator?.childDidFinish(self)
    }
}
