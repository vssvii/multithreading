//
//  AppFactory.swift
//  Navigation_2
//
//  Created by Ibragim Assaibuldayev on 03.08.2022.
//

import UIKit



class AppFactory {
    
    func makeTabBar(rootControllers: [UIViewController]) -> UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = rootControllers
        return tabBarController
    }
    
    func makeNavigationController(controller: UIViewController, color: UIColor, title: String) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.title = title
        navigationController.view.backgroundColor = color
        return navigationController
    }
    
    func makeTabBarItem(title: String, image: UIImage) -> UITabBarItem {
        let tabBarItem = UITabBarItem()
        tabBarItem.title = title
        tabBarItem.image = image
        return tabBarItem
    }
}
