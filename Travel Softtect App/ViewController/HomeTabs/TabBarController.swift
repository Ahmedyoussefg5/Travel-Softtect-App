//
//  ViewController.swift
//  Tanta Services
//
//  Created by Youssef on 11/21/18.
//  Copyright © 2018 Tantaservices. All rights reserved.
//

import UIKit
//import SideMenu

class HomeTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        navigationController?.isToolbarHidden = false
        
        let homeViewController = HomeViewController()
//        let moatamratViewController = UINavigationController(rootViewController: MoatamratSelectViewController())
//        let maaredViewController = UINavigationController(rootViewController: MaaredSelectViewController())
//        let profileViewController = UINavigationController(rootViewController: ProfileViewController())

        homeViewController.tabBarItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "home"), selectedImage: #imageLiteral(resourceName: "home"))
//        moatamratViewController.tabBarItem = UITabBarItem(title: "المؤتمرات", image: #imageLiteral(resourceName: "moatamer"), selectedImage: #imageLiteral(resourceName: "moatamer"))
//        maaredViewController.tabBarItem = UITabBarItem(title: "معارض", image: #imageLiteral(resourceName: "ma3rad"), selectedImage: #imageLiteral(resourceName: "ma3rad"))
//        profileViewController.tabBarItem = UITabBarItem(title: "حسابي", image: #imageLiteral(resourceName: "mail"), selectedImage: #imageLiteral(resourceName: "mail"))

        let tabBarList = [homeViewController]
        viewControllers = tabBarList
        
//        selectedViewController = tabBarList[3]
        
        tabBar.tintColor = #colorLiteral(red: 0.130782336, green: 0.4014846683, blue: 0.7746438384, alpha: 1)


    }

    

}

