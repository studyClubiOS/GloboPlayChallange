//
//  TabBarController.swift
//  GloboPlayChallange
//
//  Created by Jhenifer Dias on 22/06/23.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.barTintColor = .black
        addControllersTabBar()
    }
    
    //MARK: - Properties
    func addControllersTabBar() {
        
        let homeViewController = MoviesListViewController()
        let favoritesViewController = FavoritesViewController()
        
        homeViewController.title = "Início"
        homeViewController.tabBarItem.image = UIImage(named: "home")
        
        favoritesViewController.title = "Minha Lista"
        favoritesViewController.tabBarItem.image = UIImage(named: "favorites")
        
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        let favoritesNavigationController = UINavigationController(rootViewController: favoritesViewController)
        
        viewControllers = [homeNavigationController, favoritesNavigationController]
    }
}

//#Preview("TabBarController") {
//    TabBarController()
//}
