//
//  ColorUtil.swift
//  recorder
//
//  Created by mryoshio on 2015/11/14.
//  Copyright © 2015年 tachibanakikaku. All rights reserved.
//

import Foundation
import UIKit

class ColorUtil {
    
    static func baseColor() -> UIColor {
        return ColorUtil.rgb(0xc1d8ac)
    }
    
    static func pointColor() -> UIColor {
        return ColorUtil.rgb(0x6A8655)
    }
    
    static func rgb(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}

