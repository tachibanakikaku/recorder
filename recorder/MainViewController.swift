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

    var homeViewController: HomeViewController!
    var propertyViewController: PropertyViewController!

    enum TabBar: Int {
        case HomeViewController
        case PropertyViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeViewController = HomeViewController()
        homeViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .Featured, tag: TabBar.HomeViewController.rawValue)

        propertyViewController = PropertyViewController()
        propertyViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .Contacts, tag: TabBar.PropertyViewController.rawValue)
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.setViewControllers([homeViewController, propertyViewController], animated: true)
    }

}
