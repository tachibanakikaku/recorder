//
//  TopView.swift
//  recorder
//
//  Created by mryoshio on 2015/11/14.
//  Copyright © 2015年 tachibanakikaku. All rights reserved.
//

import Foundation
import UIKit

class HomeView: UIView {

    lazy var lastRangedAtLabel: UILabel = UILabel()
    lazy var lastRangedAtText: UITextField = UITextField()
    lazy var lastSentAtLabel: UILabel = UILabel()
    lazy var lastSentAtText: UITextField = UITextField()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = ColorUtil.baseColor()

        addLastRangedAt()
        addLastSentAt()
        addConstraints()
    }

    private func addLastRangedAt() {
        lastRangedAtLabel.textAlignment = .Right
        lastRangedAtLabel.text = NSLocalizedString("view.property.lastRangedAt", comment: "lastRangedAt label")
        lastRangedAtLabel.translatesAutoresizingMaskIntoConstraints = false
        lastRangedAtLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)

        lastRangedAtText.textAlignment = .Left
        lastRangedAtText.translatesAutoresizingMaskIntoConstraints = false
        lastRangedAtText.font = UIFont.preferredFontForTextStyle(UIFontTextStyleTitle2)

        addSubview(lastRangedAtLabel)
        addSubview(lastRangedAtText)
    }

    private func addLastSentAt() {
        lastSentAtLabel.textAlignment = .Right
        lastSentAtLabel.text = NSLocalizedString("view.property.lastSentAtLabel", comment: "lastSentAtLabel label")
        lastSentAtLabel.translatesAutoresizingMaskIntoConstraints = false
        lastSentAtLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)

        lastSentAtText.textAlignment = .Left
        lastSentAtText.translatesAutoresizingMaskIntoConstraints = false
        lastSentAtText.font = UIFont.preferredFontForTextStyle(UIFontTextStyleTitle2)

        addSubview(lastSentAtLabel)
        addSubview(lastSentAtText)
    }

    private func addConstraints() {
        let views = [
            "lastRangedAtLabel":lastRangedAtLabel,
            "lastRangedAtText":lastRangedAtText,
            "lastSentAtLabel":lastSentAtLabel,
            "lastSentAtText":lastSentAtText
        ]

        let metrics = [
            "h_padding":30.0,
            "v_padding_h":80.0,
            "v_padding":20.0,
            "v_item_padding":50.0
        ]

        let hLastRangedAtLabel = NSLayoutConstraint.constraintsWithVisualFormat("|-h_padding-[lastRangedAtLabel]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)

        let hLastRangedAtText = NSLayoutConstraint.constraintsWithVisualFormat("|-h_padding-[lastRangedAtText]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)

        let hLastSentAtLabel = NSLayoutConstraint.constraintsWithVisualFormat("|-h_padding-[lastSentAtLabel]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)

        let hLastSentAtText = NSLayoutConstraint.constraintsWithVisualFormat("|-h_padding-[lastSentAtText]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)

        let vLabel = NSLayoutConstraint.constraintsWithVisualFormat("V:|-v_padding_h-[lastRangedAtLabel]-v_padding-[lastRangedAtText]-v_item_padding-[lastSentAtLabel]-v_padding-[lastSentAtText]", options: NSLayoutFormatOptions.AlignAllLeft, metrics: metrics, views: views)

        addConstraints(hLastRangedAtLabel)
        addConstraints(hLastRangedAtText)
        addConstraints(hLastSentAtLabel)
        addConstraints(hLastSentAtText)
        addConstraints(vLabel)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}