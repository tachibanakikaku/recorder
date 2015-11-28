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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(HomeView(frame: self.view.frame))
        
        self.beaconManager.delegate = self
        self.beaconManager.requestAlwaysAuthorization()
    }

    func placesNearBeacon(beacon: CLBeacon) -> Dictionary<String, AnyObject> {
        let beaconKey = "\(beacon.major):\(beacon.minor)"
        if let hitBeaconInfo = ConstantUtil.placesByBeacons[beaconKey] {
            return hitBeaconInfo
        }
        return [String: AnyObject]()
    }

    func beaconManager(manager: AnyObject, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion) {
        if let nearestBeacon = beacons.first {
            let places = placesNearBeacon(nearestBeacon)
            print(places)
        }
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
