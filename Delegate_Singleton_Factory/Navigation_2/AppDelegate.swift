//
//  AppDelegate.swift
//  Navigation_2
//
//  Created by Ibragim Assaibuldayev on 26.12.2021.
//

import UIKit


@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        
        let feedViewItem = UITabBarItem()
        feedViewItem.title = "Лента пользователя"
        feedViewItem.image = UIImage(systemName: "house.fill")
        let feedView = FeedViewController()
        feedView.title = "Лента пользователя"
        feedView.tabBarItem = feedViewItem
        let feedViewNavigationController = UINavigationController(rootViewController: feedView)
        
        let profileItem = UITabBarItem()
        profileItem.title = "Профиль"
        profileItem.image = UIImage(systemName: "person.fill")
        let profile = LogInViewController()
        profile.title = "Профиль"
        profile.tabBarItem = profileItem
        let profileViewNavigationController = UINavigationController(rootViewController: profile)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [feedViewNavigationController, profileViewNavigationController]
        tabBarController.selectedIndex = 0
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        let loginInspector = LoginInspector()
        var factory = MyLoginFactory().getLoginInspector()
        
        if let tabController = window?.rootViewController as? UITabBarController, let loginNavigation = tabController.viewControllers?.last as? UINavigationController, let loginController = loginNavigation.viewControllers.first as? LogInViewController {
            loginController.delegate = loginInspector
            }
        
        factory = loginInspector
        
        return true
    }
}

