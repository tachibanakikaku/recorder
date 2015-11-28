//
//  ConstantUtil.swift
//  recorder
//
//  Created by yoshiokaas on 2015/11/28.
//  Copyright © 2015年 tachibanakikaku. All rights reserved.
//

import Foundation

class ConstantUtil {
    static let name = "NAME"
    static let groupId = "GROUP_ID"
    
    static let beaconRegion = CLBeaconRegion(
        proximityUUID: NSUUID(UUIDString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")!, identifier: "monitored region")

    static let placesByBeacons: Dictionary<String, Dictionary<String, String>> = [
        "27175:42835": [
            "name": "Dark Purple"
        ],
        "6342:23998": [
            "name": "Mint Cocktail"
        ],
        "31166:952": [
            "name": "Icy Marshmallow"
        ]
    ]
}