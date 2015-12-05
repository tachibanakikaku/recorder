//
//  PropertyView.swift
//  recorder
//
//  Created by mryoshio on 2015/11/14.
//  Copyright © 2015年 tachibanakikaku. All rights reserved.
//

import Foundation
import UIKit

class PropertyView: UIView, UITextFieldDelegate {

    lazy var nameLabel: UILabel = UILabel()
    lazy var nameText: UITextField = UITextField()
    lazy var groupLabel: UILabel = UILabel()
    lazy var groupText: UITextField = UITextField()
    lazy var majorLabel: UILabel = UILabel()
    lazy var majorText: UITextField = UITextField()
    lazy var minorLabel: UILabel = UILabel()
    lazy var minorText: UITextField = UITextField()
    lazy var activeTextField: UITextField = UITextField()

    enum Text: Int {
        case Name
        case GroupID
        case Major
        case Minor
    }

    enum Button: Int {
        case Major
        case Minor
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = ColorUtil.baseColor()
        self.layer.cornerRadius = 10.0

        addName()
        addGroupID()
        addMajor()
        addMinor()
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
        nameText.delegate = self
        nameText.tag = Text.Name.rawValue
        nameText.text = ConstantUtil.ud.stringForKey(ConstantUtil.name)
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
        groupText.delegate = self
        groupText.tag = Text.GroupID.rawValue
        groupText.text = ConstantUtil.ud.stringForKey(ConstantUtil.groupId)
        groupText.translatesAutoresizingMaskIntoConstraints = false

        addSubview(groupLabel)
        addSubview(groupText)
    }

    func addMajor() {
        majorLabel = UILabel()
        majorLabel.textAlignment = .Right
        majorLabel.text = NSLocalizedString("view.property.major", comment: "major label")
        majorLabel.translatesAutoresizingMaskIntoConstraints = false

        let majorDoneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Done, target: self, action: "onClickDone:")
        majorDoneButton.tintColor = ColorUtil.pointColor()
        majorDoneButton.tag = Button.Major.rawValue

        let majorToolbar = UIToolbar()
        majorToolbar.barStyle = .Default
        majorToolbar.translucent = true
        majorToolbar.tintColor = ColorUtil.pointColor()
        majorToolbar.sizeToFit()
        majorToolbar.bounds = CGRectOffset(majorToolbar.bounds, majorToolbar.bounds.width * -1 + majorToolbar.bounds.width / 3.5, 0) // TODO: fix size calculation
        majorToolbar.setItems([majorDoneButton], animated: true)

        majorText = UITextField()
        majorText.borderStyle = .RoundedRect
        majorText.clearButtonMode = .Always
        majorText.inputAccessoryView = majorToolbar
        majorText.placeholder = NSLocalizedString("view.property.major.placeholder", comment: "major placeholder")
        majorText.keyboardType = .DecimalPad
        majorText.returnKeyType = .Done
        majorText.delegate = self
        majorText.tag = Text.Major.rawValue
        majorText.text = ConstantUtil.ud.stringForKey(ConstantUtil.major)
        majorText.translatesAutoresizingMaskIntoConstraints = false

        addSubview(majorLabel)
        addSubview(majorText)
    }

    func addMinor() {
        minorLabel = UILabel()
        minorLabel.textAlignment = .Right
        minorLabel.text = NSLocalizedString("view.property.minor", comment: "minor label")
        minorLabel.translatesAutoresizingMaskIntoConstraints = false

        let minorDoneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Done, target: self, action: "onClickDone:")
        minorDoneButton.tintColor = ColorUtil.pointColor()
        minorDoneButton.tag = Button.Minor.rawValue

        let minorToolbar = UIToolbar()
        minorToolbar.barStyle = .Default
        minorToolbar.translucent = true
        minorToolbar.tintColor = ColorUtil.pointColor()
        minorToolbar.sizeToFit()
        minorToolbar.bounds = CGRectOffset(minorToolbar.bounds, minorToolbar.bounds.width * -1 + minorToolbar.bounds.width / 3.5, 0) // TODO: fix size calculation
        minorToolbar.setItems([minorDoneButton], animated: true)

        minorText = UITextField()
        minorText.borderStyle = .RoundedRect
        minorText.clearButtonMode = .Always
        minorText.inputAccessoryView = minorToolbar
        minorText.placeholder = NSLocalizedString("view.property.minor.placeholder", comment: "minor placeholder")
        minorText.keyboardType = .DecimalPad
        minorText.returnKeyType = .Done
        minorText.delegate = self
        minorText.tag = Text.Minor.rawValue
        minorText.text = ConstantUtil.ud.stringForKey(ConstantUtil.minor)
        minorText.translatesAutoresizingMaskIntoConstraints = false

        addSubview(minorLabel)
        addSubview(minorText)
    }

    func onClickDone(sender: UIBarButtonItem) {
        switch sender.tag {
        case Button.Major.rawValue:
            majorText.resignFirstResponder()
        case Button.Minor.rawValue:
            minorText.resignFirstResponder()
        default:
            fatalError("Invalid Done tapped!")
        }
    }

    func textFieldDidBeginEditing(textField: UITextField) {
        activeTextField = textField
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        switch textField.tag {
        case Text.Name.rawValue:
            ConstantUtil.ud.setObject(textField.text, forKey: ConstantUtil.name)
        case Text.GroupID.rawValue:
            ConstantUtil.ud.setObject(textField.text, forKey: ConstantUtil.groupId)
        case Text.Major.rawValue:
            ConstantUtil.ud.setObject(textField.text, forKey: ConstantUtil.major)
        case Text.Minor.rawValue:
            ConstantUtil.ud.setObject(textField.text, forKey: ConstantUtil.minor)
        default:
            fatalError("Invalid text end editting!")
        }
        textField.resignFirstResponder()
    }

    func addConstraints() {
        let views = [
            "nameLabel":nameLabel,
            "nameText":nameText,
            "groupLabel":groupLabel,
            "groupText":groupText,
            "majorLabel":majorLabel,
            "majorText":majorText,
            "minorLabel":minorLabel,
            "minorText":minorText
        ]

        let metrics = [
            "h_padding":30.0,
            "v_padding_h":30.0,
            "v_padding":20.0,
            "v_item_padding":40.0
        ]

        let h_name_label = NSLayoutConstraint.constraintsWithVisualFormat("|-h_padding-[nameLabel]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)

        let h_name_text = NSLayoutConstraint.constraintsWithVisualFormat("|-h_padding-[nameText]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)

        let h_group_label = NSLayoutConstraint.constraintsWithVisualFormat("|-h_padding-[groupLabel]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)

        let h_group_text = NSLayoutConstraint.constraintsWithVisualFormat("|-h_padding-[groupText]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)

        let h_major_label = NSLayoutConstraint.constraintsWithVisualFormat("|-h_padding-[majorLabel]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)

        let h_major_text = NSLayoutConstraint.constraintsWithVisualFormat("|-h_padding-[majorText]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)

        let h_minor_label = NSLayoutConstraint.constraintsWithVisualFormat("|-h_padding-[minorLabel]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)

        let h_minor_text = NSLayoutConstraint.constraintsWithVisualFormat("|-h_padding-[minorText]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)

        let v_label = NSLayoutConstraint.constraintsWithVisualFormat("V:|-v_padding_h-[nameLabel]-v_padding-[nameText]-v_item_padding-[groupLabel]-v_padding-[groupText]-v_item_padding-[majorLabel]-v_padding-[majorText]-v_item_padding-[minorLabel]-v_padding-[minorText]", options: NSLayoutFormatOptions.AlignAllLeft, metrics: metrics, views: views)

        addConstraints(h_name_label)
        addConstraints(h_name_text)
        addConstraints(h_group_label)
        addConstraints(h_group_text)
        addConstraints(h_major_label)
        addConstraints(h_major_text)
        addConstraints(h_minor_label)
        addConstraints(h_minor_text)
        addConstraints(v_label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}