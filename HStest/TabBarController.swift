//
//  TabBarController.swift
//  HStest
//
//  Created by Abduladzhi on 14.10.2022.
//

import Foundation
import UIKit

final class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = .black
        let navController = UINavigationController()
        let menuScreenViewController = MenuSceenAssembly.assembleMenuScreen()
        navController.viewControllers = [menuScreenViewController]
        
        viewControllers = [navController]
        
        viewControllers?[0].tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "heart"),
                                                      selectedImage: nil)
    }
}
