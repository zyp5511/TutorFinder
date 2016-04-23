//
//  LoginViewController.swift
//  tutorFinder
//
//  Created by Zihan Zhang on 4/2/16.
//  Copyright © 2016 ZhangYipeng. All rights reserved.
//

import UIKit
import LoopBack

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var username: UITextField!
   

    @IBOutlet weak var password: UITextField!
    
    @IBAction func check(sender: AnyObject) {
        
        BackendUtilities.sharedInstance.studentsRepo.userByLoginWithEmail(username.text, password: password.text, success: { (LBUser ) -> Void in
            NSLog("Successfully logged in.");
            
            // Display login confirmation
            //let alertController = UIAlertController(title: "Login", message:
            //    "Successfully logged in", preferredStyle: UIAlertControllerStyle.Alert)
            //alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            //self.presentViewController(alertController, animated: true, completion: nil)
            self.performSegueWithIdentifier("loginSuccess", sender: nil)
            
        }) { (error: NSError!) -> Void in
            NSLog("Error logging in.")
            
            // Display error alert
            let alertController = UIAlertController(title: "Login", message: "Login failed", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }

    }


    
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
