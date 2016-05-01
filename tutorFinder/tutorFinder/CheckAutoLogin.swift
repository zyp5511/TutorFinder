//
//  CheckAutoLogin.swift
//  tutorFinder
//
//  Created by ZhangYipeng on 16/5/1.
//  Copyright © 2016年 ZhangYipeng. All rights reserved.
//

import Foundation
import UIKit
import LoopBack
import FBSDKCoreKit
import FBSDKLoginKit
class checkAutoLogin : UIViewController {
 
    
    
    let hasLogin = NSUserDefaults.standardUserDefaults().boolForKey("hasLoginKey")
    
    override func viewDidLoad() {
    
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
       
        
        
        if (hasLogin){
            BackendUtilities.sharedInstance.studentsRepo.userByLoginWithEmail( NSUserDefaults.standardUserDefaults().stringForKey("username"), password: NSUserDefaults.standardUserDefaults().stringForKey("password"), success: { (LBUser ) -> Void in
                NSLog("Successfully logged in.");
                self.performSegueWithIdentifier("tableView", sender: self)
                
            }) { (error: NSError!) -> Void in
                NSLog("Error logging in.")
                
                // Display error alert
                let alertController = UIAlertController(title: "Login", message: "Login failed", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }
        else{
             self.performSegueWithIdentifier("needlogin", sender: self)
            }
        }






}