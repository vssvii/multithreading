//
//  Coordinator.swift
//  Navigation_2
//
//  Created by Ibragim Assaibuldayev on 03.08.2022.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    
    var navigation: UINavigationController { get }
    var childCoordinators: [Coordinator] { get set }
    func start()
}
    

