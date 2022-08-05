//
//  TypeOfViewControllerFactory.swift
//  Navigation
//
//  Created by Надежда on 2022-05-11.
//

import UIKit

enum TypeOfViewControllerFactory {
    
    
    case login(inspector: LoginViewControllerDelegate)
    case feed
    case profile(profileView: ProfileModel)
    case info
    case photos
    
    func makeViewController() -> UIViewController {
        switch self {
        case .login(let inspector):
            return LogInViewController(inspector: inspector)
        case .feed:
            return FeedViewController(viewModel: FeedModel())
        case .profile(let viewModel):
            return ProfileViewController(viewModel: viewModel)
        case .info:
            return InfoViewController()
        case .photos:
            return PhotosViewController()
        }
    }
}

