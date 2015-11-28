//
//  PropertyViewController.swift
//  recorder
//
//  Created by mryoshio on 2015/11/14.
//  Copyright © 2015年 tachibanakikaku. All rights reserved.
//

import Foundation
import UIKit

class PropertyViewController: UIViewController, UITabBarDelegate {
    
    lazy var propertyView: PropertyView = PropertyView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let ratioToSuper: CGFloat = 0.85
        let x = (self.view.frame.width - self.view.frame.width * ratioToSuper) / 2
        let y = (self.view.frame.height - self.view.frame.height * ratioToSuper) / 2
        let w = self.view.frame.width * ratioToSuper
        let h = self.view.frame.height * ratioToSuper
        
        propertyView.frame = CGRectMake(x, y, w, h)
        self.view.addSubview(propertyView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}