//
//  UITabBarController.swift
//  PhotoSearcher
//
//  Created by Alex Pupko on 12.01.22.
//

import UIKit

final class MainTabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.backgroundColor = .lightGray
        tabBar.tintColor = .black
        
        let HomeVC = HomeViewController()
        HomeVC.title = "Home"
        HomeVC.tabBarItem.image = UIImage(systemName: "house")
     
        let favVC = FavoriteViewController()
        favVC.title = "Favourite"
        favVC.tabBarItem.image = UIImage(systemName: "star")

        self.setViewControllers([HomeVC, favVC], animated: true)
    
    }
    
}
