//
//  PropertyViewController.swift
//  recorder
//
//  Created by mryoshio on 2015/11/14.
//  Copyright © 2015年 tachibanakikaku. All rights reserved.
//

import Foundation
import UIKit

class PropertyViewController: UIViewController {

    lazy var propertyView: PropertyView = PropertyView()
    lazy var scrollView: UIScrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let ratioToSuper: CGFloat = 0.85
        let x = (self.view.frame.width - self.view.frame.width * ratioToSuper) / 2
        let y = (self.view.frame.height - self.view.frame.height * ratioToSuper) / 2
        let w = self.view.frame.width * ratioToSuper
        let h = self.view.frame.height * ratioToSuper

        propertyView.frame = CGRectMake(x, y, w, h)

        scrollView.frame = propertyView.bounds
        scrollView.backgroundColor = UIColor.whiteColor()
        scrollView.addSubview(propertyView)
        self.view = scrollView

        registerForKeyboardNotifications()
    }

    func registerForKeyboardNotifications() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWasShown:", name: UIKeyboardDidShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillBeHidden:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func keyboardWasShown(notification: NSNotification) {
        let info = notification.userInfo
        let keyboardRect = (info![UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        var scrollPointHeight: CGFloat = 0.0

        if keyboardRect.origin.y <= propertyView.activeTextField.frame.origin.y + propertyView.activeTextField.frame.height {
            scrollPointHeight = keyboardRect.origin.y - propertyView.activeTextField.frame.height
        }

        scrollView.setContentOffset(CGPointMake(0, scrollPointHeight), animated: true)
    }

    func keyboardWillBeHidden(_:NSNotification) {
        scrollView.setContentOffset(CGPointZero, animated:true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}