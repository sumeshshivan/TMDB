//
//  AppCoordinator.swift
//  TMDB
//
//  Created by sumesh shivan on 09/03/22.
//

import UIKit

class AppCoordinator: NavbarCoordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        self.showDashboard()
    }
}

// MARK: - Navigation
extension AppCoordinator {
    private func showDashboard() {
        let mainCoordinator = MainCoordinator(navigationController: navigationController, delegate: self)
        childCoordinators.append(mainCoordinator)
        mainCoordinator.start()
    }
}

extension AppCoordinator: MainCoordinatorDelegate {
}
