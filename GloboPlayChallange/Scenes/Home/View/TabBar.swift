//
//  TabBarController.swift
//  GloboPlayChallange
//
//  Created by Jhenifer Dias on 22/06/23.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Define a cor de fundo da Tab Bar
        tabBar.barTintColor = .black
        
        let homeViewController = MoviesListViewController()
        let favoritesViewController = FavoritesViewController()
        
        homeViewController.title = "Início"
        homeViewController.tabBarItem.image = UIImage(named: "home")
        
        favoritesViewController.title = "Minha Lista"
        favoritesViewController.tabBarItem.image = UIImage(named: "favorites")
        
        // Cria instâncias de UINavigationController
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        let favoritesNavigationController = UINavigationController(rootViewController: favoritesViewController)
        
        viewControllers = [homeNavigationController, favoritesNavigationController]
    }
}

#Preview("TabBarController") {
    TabBarController()
}
