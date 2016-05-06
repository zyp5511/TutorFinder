//
//  ProfileTableViewController.swift
//  tutorFinder
//
//  Created by Zihan Zhang on 4/4/16.
//  Copyright © 2016 ZhangYipeng. All rights reserved.
//

import UIKit
import LoopBack

class ProfileTableViewController: UITableViewController {
    var student = Student()
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var name1: UILabel!
    @IBOutlet weak var gender1: UIImageView!
    @IBOutlet weak var rating1: UIImageView!
    @IBOutlet weak var rating2: UIImageView!
    @IBOutlet weak var rating3: UIImageView!
    @IBOutlet weak var rating4: UIImageView!
    @IBOutlet weak var rating5: UIImageView!
    
    
    @IBOutlet weak var name2: UILabel!
    @IBOutlet weak var email3: UILabel!
    @IBOutlet weak var school4: UILabel!
    @IBOutlet weak var education5: UILabel!
    @IBOutlet weak var subject6: UILabel!
    
    @IBOutlet weak var social7a: UIImageView!   //fixed
    @IBOutlet weak var social7b: UIImageView!   //fixed
    @IBOutlet weak var social7c: UIImageView!   //fixed
    @IBOutlet weak var availability8: UITextView!
    @IBOutlet weak var description9: UITextView!
    
    @IBOutlet weak var logoutButton: UIButton!

    @IBOutlet weak var tutorSwitch: UISwitch!
    @IBOutlet weak var update: UIButton!
    
    var currentUser: Student = Student()
    var isTutor : Bool = true
    var studentID : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoutButton.setTitle("LogOut", forState: UIControlState.Normal)
        logoutButton.frame.size.width = 100
        
        
        self.navigationController?.navigationBar.barStyle = UIBarStyle.Black
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        
        
        
        BackendUtilities.sharedInstance.studentsRepo.findCurrentUserWithSuccess({ (user) -> Void in
            NSLog("Found user")
            if let _ = user    {
                self.currentUser = user as! Student
                 self.loadUserInformation()
                print(self.currentUser._id)
            }
            else    {
            }
        }) { (error: NSError!) -> Void in
            NSLog("Error fetching current user")
        }
        
        availability8.layer.borderColor = UIColor(red:128/255, green: 128/255, blue: 128/255,alpha:1).CGColor
        availability8.layer.borderWidth = CGFloat(Float(1.0))
        availability8.layer.cornerRadius = CGFloat(Float(5.0))
        description9.layer.borderColor = UIColor(red:128/255, green: 128/255, blue: 128/255,alpha:1).CGColor
        description9.layer.borderWidth = CGFloat(Float(1.0))
        description9.layer.cornerRadius = CGFloat(Float(5.0))
       
    }
    
    
    @IBAction func logoutButton(sender: AnyObject) {
        BackendUtilities.sharedInstance.studentsRepo.logoutWithSuccess({
            NSUserDefaults.standardUserDefaults().setValue(nil, forKey: "username")
            NSUserDefaults.standardUserDefaults().setValue(nil, forKey: "password")
            NSUserDefaults.standardUserDefaults().setBool(false, forKey: "hasLoginKey")
            self.performSegueWithIdentifier("tologin", sender: self)
            }
            , failure:{ (error: NSError!) -> Void in
                NSLog("Error fetching current user")
            }
        )
    
    
    }
 
    
    func loadUserInformation(){
    
        if (currentUser.gender == "Male")
        {
            gender1.image = UIImage(named:"male")
        }
        else if (currentUser.gender == "Female")
        {
            gender1.image = UIImage(named:"female")
        }else {
            gender1.image = UIImage(named:"unknownGen")
        }
        
        
        name1.text = currentUser.username
        name2.text = currentUser.name
        email3.text = currentUser.email
        school4.text = currentUser.university
        education5.text = currentUser.degree
        subject6.text = currentUser.major
        
        availability8.text = currentUser.availability
        description9.text = currentUser.descriptions
        tutorSwitch.on = currentUser.tutor.boolValue
        
        description9.userInteractionEnabled = false
        studentID = String(currentUser._id)
        
        if ((studentID == "1") || (studentID ==  "2") || (studentID == "3") || (studentID == "4") || (studentID == "5") || (studentID == "6") || (studentID == "7") || (studentID == "8")){
            image1.image = UIImage(named: studentID)
        }
        else {
            image1.image = UIImage(named: "default")
        }
        

        
        let rating = Int(currentUser.rating)
        
        
        if rating == 0 {
            rating1.image = UIImage(named: "emptystar")
        }
        else {
            rating1.image = UIImage(named:"fullstar")
        }
        
        if rating <= 1 {
            rating2.image = UIImage(named: "emptystar")
        }
        else {
            rating2.image = UIImage(named:"fullstar")
        }
        
        if rating <= 2 {
            rating3.image = UIImage(named: "emptystar")
        }
        else {
            rating3.image = UIImage(named:"fullstar")
        }
        
        if rating <= 3 {
            rating4.image = UIImage(named: "emptystar")
        }
        else {
            rating4.image = UIImage(named:"fullstar")
        }
        
        if rating <= 4 {
            rating5.image = UIImage(named: "emptystar")
        }
        else {
            rating5.image = UIImage(named:"fullstar")
        }

    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    @IBAction func updateAvailability(sender: UIButton) {
            self.currentUser.availability = self.availability8.text
            self.currentUser.saveWithSuccess({ () -> Void in
                    NSLog("sucessfully saved")
                let alertController = UIAlertController(title: "Save Successfully", message: "", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
                    }, failure: { (error: NSError!) -> Void in
                        NSLog(error.description)
                        let alertController = UIAlertController(title: "Error Saving", message: "", preferredStyle: UIAlertControllerStyle.Alert)
                        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
                        self.presentViewController(alertController, animated: true, completion: nil)
                        
            })
        
        loadUserInformation()
    

    }

    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
    @IBAction func changeTutorStatus(sender: UIButton) {
        if tutorSwitch.on{
            print("switch is on")
            isTutor = true;
           // tutorSwitch.setOn(false, animated: true)
            currentUser.tutor = isTutor
            self.currentUser.saveWithSuccess({ () -> Void in
                NSLog("sucessfully saved")
                }, failure: { (error: NSError!) -> Void in
                    NSLog("error saving")
            })
        }else {
            print("switch is off")
            isTutor = false;
           // tutorSwitch.setOn(true, animated: true)
            currentUser.tutor = isTutor
            self.currentUser.saveWithSuccess({ () -> Void in
                NSLog("sucessfully saved")
                }, failure: { (error: NSError!) -> Void in
                    NSLog("error saving")
            })

        }
        self.loadUserInformation()
        
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


}
