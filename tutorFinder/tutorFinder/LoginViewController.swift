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

    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var createInfoLabel: UILabel!
    
    let MyKeychainWrapper = KeychainWrapper()
    let createLoginButtonTag = 0
    let loginButtonTag = 1
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         passwordTextField.secureTextEntry = true
        let hasLogin = NSUserDefaults.standardUserDefaults().boolForKey("hasLoginKey")
        
        // 2.
        if hasLogin {
            loginButton.setTitle("Login", forState: UIControlState.Normal)
            loginButton.tag = loginButtonTag
           // createInfoLabel.hidden = true
        } else {
            loginButton.setTitle("Create", forState: UIControlState.Normal)
            loginButton.tag = createLoginButtonTag
           // createInfoLabel.hidden = false
        }
        
        // 3.
        if let storedUsername = NSUserDefaults.standardUserDefaults().valueForKey("username") as? String {
            usernameTextField.text = storedUsername as String
        }
        
        passwordTextField.secureTextEntry = true
        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - Action for checking username/password
    @IBAction func loginAction(sender: AnyObject) {
        
        // 1.
        if (usernameTextField.text == "" || passwordTextField.text == "") {
            let alertView = UIAlertController(title: "Login Problem",
                                              message: "Wrong username or password." as String, preferredStyle:.Alert)
            let okAction = UIAlertAction(title: "Foiled Again!", style: .Default, handler: nil)
            alertView.addAction(okAction)
            self.presentViewController(alertView, animated: true, completion: nil)
            return;
        }
        
        // 2.
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
        // 3.
        if sender.tag == createLoginButtonTag {
            
            // 4.
            let hasLoginKey = NSUserDefaults.standardUserDefaults().boolForKey("hasLoginKey")
            if hasLoginKey == false {
                NSUserDefaults.standardUserDefaults().setValue(self.usernameTextField.text, forKey: "username")
            }
            
            // 5.
            MyKeychainWrapper.mySetObject(passwordTextField.text, forKey:kSecValueData)
            MyKeychainWrapper.writeToKeychain()
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "hasLoginKey")
            NSUserDefaults.standardUserDefaults().synchronize()
            loginButton.tag = loginButtonTag
            
            performSegueWithIdentifier("dismissLogin", sender: self)
        } else if sender.tag == loginButtonTag {
            // 6.
            if checkLogin(usernameTextField.text!, password: passwordTextField.text!) {
                performSegueWithIdentifier("loginSuccess", sender: self)
            } else {
                // 7.
                let alertView = UIAlertController(title: "Login Problem",
                                                  message: "Wrong username or password." as String, preferredStyle:.Alert)
                let okAction = UIAlertAction(title: "Foiled Again!", style: .Default, handler: nil)
                alertView.addAction(okAction)
                self.presentViewController(alertView, animated: true, completion: nil)
            }
        }
    }

    
    
  func checkLogin(username: String, password: String ) -> Bool {
    var success = false ;
        BackendUtilities.sharedInstance.studentsRepo.userByLoginWithEmail(username, password: password, success: { (LBUser ) -> Void in
            NSLog("Successfully logged in.");
            
            // Display login confirmation
            //let alertController = UIAlertController(title: "Login", message:
            //    "Successfully logged in", preferredStyle: UIAlertControllerStyle.Alert)
            //alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            //self.presentViewController(alertController, animated: true, completion: nil)
            //self.performSegueWithIdentifier("loginSuccess", sender: self)
            success = true;
            
        }) { (error: NSError!) -> Void in
            NSLog("Error logging in.")
            
            // Display error alert
            let alertController = UIAlertController(title: "Login", message: "Login failed", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            success = false;
        }
    return success

    }


    
    @IBAction func signuppressed(sender: AnyObject) {
        self.performSegueWithIdentifier("toSignUp", sender: self)
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
