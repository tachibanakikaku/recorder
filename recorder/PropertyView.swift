//
//  PropertyView.swift
//  recorder
//
//  Created by mryoshio on 2015/11/14.
//  Copyright © 2015年 tachibanakikaku. All rights reserved.
//

import Foundation
import UIKit

class PropertyView: UIView {

    var nameLabel: UILabel!
    var nameText: UITextField!
    var groupLabel: UILabel!
    var groupText: UITextField!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = ColorUtil.baseColor()
        self.layer.cornerRadius = 10.0

        addName()
        addGroupID()
        addConstraints()
    }

    func addName() {
        nameLabel = UILabel()
        nameLabel.textAlignment = .Right
        nameLabel.text = NSLocalizedString("view.property.name", comment: "name label")
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        nameText = UITextField()
        nameText.borderStyle = .RoundedRect
        nameText.clearButtonMode = .Always
        nameText.placeholder = NSLocalizedString("view.property.name.placeholder", comment: "name placeholder")
        nameText.returnKeyType = .Done
        nameText.translatesAutoresizingMaskIntoConstraints = false

        addSubview(nameLabel)
        addSubview(nameText)
    }

    func addGroupID() {
        groupLabel = UILabel()
        groupLabel.textAlignment = .Right
        groupLabel.text = NSLocalizedString("view.property.groupID", comment: "group ID label")
        groupLabel.translatesAutoresizingMaskIntoConstraints = false

        groupText = UITextField()
        groupText.borderStyle = .RoundedRect
        groupText.clearButtonMode = .Always
        groupText.placeholder = NSLocalizedString("view.property.groupID.placeholder", comment: "group ID placeholder")
        groupText.returnKeyType = .Done
        groupText.translatesAutoresizingMaskIntoConstraints = false

        addSubview(groupLabel)
        addSubview(groupText)
    }

    func addConstraints() {
        let views = [
            "nameLabel":nameLabel,
            "nameText":nameText,
            "groupLabel":groupLabel,
            "groupText":groupText
        ]
        
        let metrics = [
            "h_padding":30.0,
            "v_padding":20.0,
            "v_item_padding":40.0
        ]
        
        let h_name_label = NSLayoutConstraint.constraintsWithVisualFormat("|-h_padding-[nameLabel]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)
        
        let h_name_text = NSLayoutConstraint.constraintsWithVisualFormat("|-h_padding-[nameText]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)
        
        let h_group_label = NSLayoutConstraint.constraintsWithVisualFormat("|-h_padding-[groupLabel]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)
        
        let h_group_text = NSLayoutConstraint.constraintsWithVisualFormat("|-h_padding-[groupText]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)
        
        let v_label = NSLayoutConstraint.constraintsWithVisualFormat("V:|-v_item_padding-[nameLabel]-v_padding-[nameText]-v_item_padding-[groupLabel]-v_padding-[groupText]", options: NSLayoutFormatOptions.AlignAllLeft, metrics: metrics, views: views)
        
        addConstraints(h_name_label)
        addConstraints(h_name_text)
        addConstraints(h_group_label)
        addConstraints(h_group_text)
        addConstraints(v_label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}