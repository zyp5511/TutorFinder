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

    
    var hasLogin = NSUserDefaults.standardUserDefaults().boolForKey("hasLoginKey")
    
    override func viewDidLoad() {
         super.viewDidLoad()
          //print(hasLogin)
        }
    
    @IBAction func tologin(segue: UIStoryboardSegue) {
        print("回来了")
        hasLogin = NSUserDefaults.standardUserDefaults().boolForKey("hasLoginKey")
        //checkLogin()
        self.performSegueWithIdentifier("needlogin", sender: self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        //super.viewDidAppear()
        checkLogin()
    }
    
    
    @IBAction func unwindToMenu(segue: UIStoryboardSegue) {
      //  print("hahahaha")
        hasLogin = NSUserDefaults.standardUserDefaults().boolForKey("hasLoginKey")
       // print(hasLogin)
        checkLogin()
        
    }

    /*
   override func canPerformUnwindSegueAction(action: Selector, fromViewController: UIViewController, withSender sender: AnyObject) -> Bool {
        let result = (self.description == "LoginViewController")
        print("11")
    
         hasLogin = NSUserDefaults.standardUserDefaults().boolForKey("hasLoginKey")
        self.reloadInputViews()
    
        return result;
    }
    
    */
    func checkLogin (){
        //hasLogin=false;
        if (hasLogin){
            BackendUtilities.sharedInstance.studentsRepo.userByLoginWithEmail( NSUserDefaults.standardUserDefaults().stringForKey("username"), password: NSUserDefaults.standardUserDefaults().stringForKey("password"), success: { (LBUser ) -> Void in
                NSLog("Successfully logged in incheckogin.");
                self.performSegueWithIdentifier("tableView", sender: self)
            }) { (error: NSError!) -> Void in
                NSLog("Error logging in.")
                // Display error alert
                self.performSegueWithIdentifier("needlogin", sender: self)
                let alertController = UIAlertController(title: "Login", message: "Login failed", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
                 self.performSegueWithIdentifier("needlogin", sender: self)
               
            }
        }
        else{
            //print(hasLogin)
            self.performSegueWithIdentifier("needlogin", sender: self)
        }
    }






}