//
//  HomeViewController.swift
//  recorder
//
//  Created by mryoshio on 2015/11/14.
//  Copyright © 2015年 tachibanakikaku. All rights reserved.
//

import Alamofire
import Foundation
import UIKit

class HomeViewController: UIViewController, ESTBeaconManagerDelegate {

    let beaconManager = ESTBeaconManager()

    lazy var major: Int = Int(ConstantUtil.ud.valueForKey(ConstantUtil.major) as! String)!
    lazy var minor: Int = Int(ConstantUtil.ud.valueForKey(ConstantUtil.minor) as! String)!
    let dateFormatter = NSDateFormatter()

    lazy var rangedBeacons = [String: [NSDate]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = HomeView(frame: self.view.frame)

        let locale = NSLocale.currentLocale().objectForKey(NSLocaleIdentifier) as! String
        dateFormatter.locale = NSLocale(localeIdentifier: locale)
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss"

        self.beaconManager.delegate = self
        self.beaconManager.requestAlwaysAuthorization()
    }

    func beaconManager(manager: AnyObject, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion) {
        if let nearestBeacon = beacons.first {
            if nearestBeacon.major == major && nearestBeacon.minor == minor {
                let now = NSDate()
                let key = "\(major):\(minor)"

                (self.view as! HomeView).lastRangedAtText.text = dateFormatter.stringFromDate(now)

                if rangedBeacons.indexForKey(key) == nil {
                    rangedBeacons.updateValue([NSDate()], forKey: key)
                    print("first: \(rangedBeacons)")
                } else {
                    let past = rangedBeacons[key]!.last!

                    if now.timeIntervalSinceDate(past) > DateTimeUtil.record_interval_seconds {
                        if sendToServer(key, datetime: now) {
                            rangedBeacons[key] = nil
                            (self.view as! HomeView).lastSentAtText.text = dateFormatter.stringFromDate(now)
                        }
                        rangedBeacons[key]?.append(now)
                        print("\(rangedBeacons[key]!.count): \(rangedBeacons)")
                    }
                }
            }
        }
    }

    private func sendToServer(key: String, datetime: NSDate) -> Bool {
        let url: String = "https://teru@liferay.com:ttt@nakura1977.cloudapp.net/api/jsonws/sample-portlet.foo/add-foo"
        let major = ConstantUtil.ud.stringForKey(ConstantUtil.major)
        let minor = ConstantUtil.ud.stringForKey(ConstantUtil.minor)
        var params = [String: AnyObject]()
        params[ConstantUtil.name] = ConstantUtil.ud.stringForKey(ConstantUtil.name)
        params[ConstantUtil.groupId] = ConstantUtil.ud.stringForKey(ConstantUtil.groupId)
        params[ConstantUtil.major] = major
        params[ConstantUtil.minor] = minor
        params["DATA"] =  rangedBeacons[major! + ":" + minor!]!.map { dateFormatter.stringFromDate($0) }

        request(.POST, url, parameters: params, encoding: .JSON).responseJSON {
            response in
            print(response)

            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }
        return true
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
