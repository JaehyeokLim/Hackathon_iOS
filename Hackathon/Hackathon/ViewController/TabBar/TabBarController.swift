//
//  TabBarController.swift
//  Hackathon
//
//  Created by Jaehyeok Lim on 2022/09/15.
//

import UIKit
import SnapKit

class CustomTabBarController: UITabBarController {
    let addViewControllerNavigationButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLayout()
    }
    
    func configureLayout() {
        self.tabBar.tintColor = UIColor.titleLogoColor
        self.tabBar.unselectedItemTintColor = UIColor.darkGray
        self.tabBar.backgroundColor = UIColor.topViewBackgroundColor
        self.tabBar.shadowImage = UIImage()
        self.tabBar.backgroundImage = UIImage()
        
        let firstViewController = HomeViewController()
        let secondViewController = BoxViewController()
        let thirdViewController = TradeViewController()
        let fourthViewController = UserProfileViewController()
        
        firstViewController.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        firstViewController.tabBarItem.image = UIImage(systemName: "house")
        
        secondViewController.tabBarItem.selectedImage = UIImage(systemName: "shippingbox.fill")
        secondViewController.tabBarItem.image = UIImage(systemName: "shippingbox")
        
        thirdViewController.tabBarItem.selectedImage = UIImage(systemName: "arrow.2.squarepath")
        thirdViewController.tabBarItem.image = UIImage(systemName: "arrow.2.squarepath")
        
        fourthViewController.tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        fourthViewController.tabBarItem.image = UIImage(systemName: "person")
        
        viewControllers = [firstViewController, secondViewController, thirdViewController, fourthViewController]
    }
}

