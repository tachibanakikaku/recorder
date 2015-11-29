//
//  HomeViewController.swift
//  recorder
//
//  Created by mryoshio on 2015/11/14.
//  Copyright © 2015年 tachibanakikaku. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController, ESTBeaconManagerDelegate {

    let beaconManager = ESTBeaconManager()

    lazy var major: Int = Int(ConstantUtil.ud.valueForKey(ConstantUtil.major) as! String)!
    lazy var minor: Int = Int(ConstantUtil.ud.valueForKey(ConstantUtil.minor) as! String)!

    lazy var rangedBeacons = [String: [NSDate]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(HomeView(frame: self.view.frame))
        
        self.beaconManager.delegate = self
        self.beaconManager.requestAlwaysAuthorization()
    }

    func beaconManager(manager: AnyObject, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion) {
        if let nearestBeacon = beacons.first {
            if nearestBeacon.major == major && nearestBeacon.minor == minor {
                let key = "\(major):\(minor)"
                if rangedBeacons.indexForKey(key) == nil {
                    rangedBeacons.updateValue([NSDate()], forKey: key)
                    print("first: \(rangedBeacons)")
                } else {
                    let now: NSDate = NSDate()
                    let past = rangedBeacons[key]!.last!
                    if now.timeIntervalSinceDate(past) > DateTimeUtil.record_interval_seconds {
                        sendToServer(key, datetime: now)
                        rangedBeacons[key]?.append(now)
                        print("\(rangedBeacons[key]!.count): \(rangedBeacons)")
                    }
                }
            }
        }
    }

    private func sendToServer(key: String, datetime: NSDate) {
        // clear Array: rangedBeacons.indexForKey(key) if succeed in send to server
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.beaconManager.startRangingBeaconsInRegion(ConstantUtil.beaconRegion)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        self.beaconManager.stopRangingBeaconsInRegion(ConstantUtil.beaconRegion)
    }

}
