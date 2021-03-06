//
//  AppDelegate.swift
//  tutorFinder
//
//  Created by ZhangYipeng on 16/2/29.
//  Copyright © 2016年 ZhangYipeng. All rights reserved.
//

import UIKit
import LoopBack
import FBSDKCoreKit
import FBSDKLoginKit;

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate ,CLLocationManagerDelegate{

    var window: UIWindow?
    var locationManager: CLLocationManager!
    var seenError : Bool = false
    var locationFixAchieved : Bool = false
    var locationStatus : NSString = "Not Started"
    
    ////http://pure-spire-51842.herokuapp.com/api
    var adapter = LBRESTAdapter(URL: NSURL(string: "http://pure-spire-51842.herokuapp.com/api"))
    //var studentsRepo = adapter.repositoryWithClass(StudentsRepo) as! StudentsRepo
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        initLocationManager();
        print("adbcd")
         UINavigationBar.appearance().barTintColor = UIColor(red: 153/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0)
        // return FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        return true
    }
    
   /*
    func application(application: UIApplication,
                     openURL url: NSURL,
                             sourceApplication: String?,
                             annotation: AnyObject?) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(
            application,
            openURL: url,
            sourceApplication: sourceApplication,
            annotation: annotation)
    }
    
  */

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
         // FBSDKAppEvents.activateApp()
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
    // Location Manager helper stuff
    func initLocationManager() {
        seenError = false
        locationFixAchieved = false
        locationManager = CLLocationManager()
        locationManager.delegate = self
        CLLocationManager.locationServicesEnabled()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.requestAlwaysAuthorization()
    }

    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        locationManager.stopUpdatingLocation()
        if ((error) == true) {
            if (seenError == false) {
                seenError = true
                print(error)
            }
        }
    }
  
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        self.locationManager.stopUpdatingLocation()
        
        let latestLocation = locations.last
        
        let latitude = String(format: "%.4f", latestLocation!.coordinate.latitude)
        let longitude = String(format: "%.4f", latestLocation!.coordinate.longitude)
        
        print("Latitude: \(latitude)")
        print("Longitude: \(longitude)")
    }

    func locationManager(manager: CLLocationManager,
                         didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        var shouldIAllow = false
        
        switch status {
        case CLAuthorizationStatus.Restricted:
            locationStatus = "Restricted Access to location"
        case CLAuthorizationStatus.Denied:
            locationStatus = "User denied access to location"
        case CLAuthorizationStatus.NotDetermined:
            locationStatus = "Status not determined"
        default:
            locationStatus = "Allowed to location Access"
            shouldIAllow = true
        }
        NSNotificationCenter.defaultCenter().postNotificationName("LabelHasbeenUpdated", object: nil)
        if (shouldIAllow == true) {
            NSLog("Location to Allowed")
            // Start location services
            locationManager.startUpdatingLocation()
        } else {
            NSLog("Denied access: \(locationStatus)")
        }
    }
    
    


}

