//
//  SignUpViewController.swift
//  tutorFinder
//
//  Created by Zihan Zhang on 4/4/16.
//  Copyright © 2016 ZhangYipeng. All rights reserved.
//

import UIKit
import LoopBack
import CoreLocation


class SignUpViewController: UIViewController ,UIPickerViewDataSource, UIPickerViewDelegate, CLLocationManagerDelegate {

    let pickerData = ["Male","Female","Rather Not Tell"]
    
    @IBOutlet weak var txtemail: UITextField!
    
    @IBOutlet weak var txtUsername: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var txtreenter: UITextField!
    
    @IBOutlet weak var txtQuestion: UITextField!
    
    @IBOutlet weak var txtAnswer: UITextField!
    
    @IBOutlet weak var sexPicker: UIPickerView!
    
    var gender = "Male";
    
    var here:CLLocation!

    var locationManager: CLLocationManager!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        sexPicker.dataSource = self;
        sexPicker.delegate = self;
        locationManager = CLLocationManager()
        locationManager.delegate = self
        here = CLLocation(latitude: 43.0731 ,longitude: -89.4012)
        //self.initLocationManager()
        //there = location
        
        
        //locationManager.desiredAccuracy = kCLLocationAccuracyBest
       // locationManager.delegate = self
       // locationManager.requestWhenInUseAuthorization()
        //locationManager.startUpdatingLocation()
    }
    
    
    
    @IBAction func cancelBtn(sender: AnyObject) {
    
        self.performSegueWithIdentifier("signupSuccess", sender: self)
    
    }
    
    
    @IBAction func signupButton(sender: AnyObject) {
       
        let username:NSString = txtUsername.text!
        let password:NSString = txtPassword.text!
        let reenter:NSString = txtreenter.text!
        let sex :NSString = gender
        let email: NSString = txtemail.text!
        let securityQuestion : NSString = txtQuestion.text!
        let securityAnswers : NSString = txtAnswer.text!
        
        
        if ( username.isEqualToString("") || password.isEqualToString("") ||
            email.isEqualToString("")) {
            
            // Display error alert
            let alertController = UIAlertController(title: "Sign in Failed", message: "Please enter Username Password and email", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            
            
        } else if( !password.isEqualToString(reenter as String) ){
            // Display error alert
            let alertController = UIAlertController(title: "Sign in Failed", message: "password not match", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }
        else    {
            
            let user:Student = BackendUtilities.sharedInstance.studentsRepo.createUserWithEmail(email as String, password: password as String) as! Student
            user.setValuesForKeysWithDictionary(["gender" : sex as String ])
          //  user.setValuesForKeysWithDictionary(["id" : "1" ])
            user.setValuesForKeysWithDictionary(["rating" : 3 ])
            user.setValuesForKeysWithDictionary(["tutor" : true])
            user.setValuesForKeysWithDictionary(["username" : username as String])
//            user.setValuesForKeysWithDictionary(["descriptions" : "Unknown"])
//          user.setValuesForKeysWithDictionary(["realm" : "Unknown"])
            user.setValuesForKeysWithDictionary(["status" : "Offline"])
            user.setValuesForKeysWithDictionary(["availability" : "Unknown"])
            user.setValuesForKeysWithDictionary(["securityQuestion" : securityQuestion as String])
            user.setValuesForKeysWithDictionary(["securityAnswer" : securityAnswers as String])
            user.setValuesForKeysWithDictionary(["university" : "University of Tutor"])
            user.setValuesForKeysWithDictionary(["major" : "Unknown"])
            user.setValuesForKeysWithDictionary(["location" : here])

           // user.setValuesForKeysWithDictionary(["location": here])
        
            
            NSLog(String(user._id))
            //            user.gender = "male"
            //            user.rating = 3
            //            user.degree = "Bachelor"
            NSLog(String(user))
            user.saveWithSuccess({ () -> Void in
                NSLog("Successfully registered new user with User ID: ")
                NSLog(String(user._id as! Int))
                self.performSegueWithIdentifier("signupSuccess", sender: self)
            }) { (error: NSError!) -> Void in
                NSLog(error.description)
                NSLog(String(user))
                // Display error alert for registration
                let alertController = UIAlertController(title: "Registration", message:
                    "Error creating new user", preferredStyle: UIAlertControllerStyle.Alert)
                
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }
    }
/*
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        self.locationManager.stopUpdatingLocation()
        
        let latestLocation = locations.last
        
        let latitude = String(format: "%.4f", latestLocation!.coordinate.latitude)
        let longitude = String(format: "%.4f", latestLocation!.coordinate.longitude)
        
        print("Latitude: \(latitude)")
        print("Longitude: \(longitude)")
    }
    
  */
    
    
    
    
    
    
    
    
    
    
    
    

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
    //MARK: - Delegates and data sources
    //MARK: Data Sources
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    //MARK: Delegates
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
          gender = pickerData[row]
    }
    
    //size
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 250
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        let titleData = pickerData[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 15.0)!,NSForegroundColorAttributeName:UIColor.blackColor()])
        pickerLabel.attributedText = myTitle
        return pickerLabel
    }
    
    
    
}
