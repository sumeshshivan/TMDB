//
//  Coordinator.swift
//  TMDB
//
//  Created by sumesh shivan on 09/03/22.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    func start()
}

protocol NavbarCoordinator: Coordinator {
    var navigationController: UINavigationController { get set }
}

protocol TabbarCoordinator: Coordinator {
    var tabbarController: UITabBarController { get set }
}
