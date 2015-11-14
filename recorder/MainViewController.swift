//
//  MainViewController.swift
//  recorder
//
//  Created by mryoshio on 2015/11/14.
//  Copyright © 2015年 tachibanakikaku. All rights reserved.
//

import Foundation
import UIKit

class MainViewController: UITabBarController {

    var homeView: HomeViewController!
    var propertyView: PropertyViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeView = HomeViewController()
        homeView.tabBarItem = UITabBarItem(tabBarSystemItem: .Featured, tag: 0)

        propertyView = PropertyViewController()
        propertyView.tabBarItem = UITabBarItem(tabBarSystemItem: .Contacts, tag: 1)
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.setViewControllers([homeView, propertyView], animated: true)
    }

}
