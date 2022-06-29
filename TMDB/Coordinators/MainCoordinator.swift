//
//  MainCoordinator.swift
//  TMDB
//
//  Created by sumesh shivan on 09/03/22.
//

import UIKit

protocol MainCoordinatorDelegate: AnyObject {
}

class MainCoordinator: NSObject, TabbarCoordinator {

    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var tabbarController: UITabBarController
    
    weak var delegate: MainCoordinatorDelegate?
    
    init(navigationController: UINavigationController, delegate: MainCoordinatorDelegate) {
        self.navigationController = navigationController
        self.delegate = delegate
        self.tabbarController = UITabBarController()
    }
    
    func start() {
        let popular = ViewControllerFactory.getPopularMoviesListVC()
        let latest = ViewControllerFactory.getLatestMoviesListVC()

        tabbarController.setViewControllers([
            popular,
            latest,
        ], animated: false)
        
        popular.tabBarItem = UITabBarItem(title: "Latest", image: UIImage(systemName: "list.and.film"), tag: 0)
        latest.tabBarItem = UITabBarItem(title: "Popular", image: UIImage(systemName: "flame"), tag: 0)
        
        tabbarController.tabBar.tintColor = .primary
        tabbarController.tabBar.backgroundColor = .white
        tabbarController.tabBar.unselectedItemTintColor = .lightGray
        
        navigationController.setViewControllers([tabbarController], animated: true)
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}

// MARK: - Navigation
extension MainCoordinator {
    private func showMovieDetail(courseId: Int) {
//        courseCoordinator = CourseCoordinator(navigationController: courseListNavigationVC,
//                                                  courseId: courseId)
//        childCoordinators.append(courseCoordinator)
//        courseCoordinator.start()
    }
}

extension MainCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        // Read the view controller we’re moving from.
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }

        // Check whether our view controller array already contains that view controller. If it does it means we’re pushing a different view controller on top rather than popping it, so exit.
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
    }
}
