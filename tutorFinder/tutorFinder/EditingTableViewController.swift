//
//  EditingTableViewController.swift
//  tutorFinder
//
//  Created by Zihan Zhang on 4/4/16.
//  Copyright © 2016 ZhangYipeng. All rights reserved.
//

import UIKit

class EditingTableViewController: UITableViewController {
    
    var currentUser: Student = Student()

    @IBOutlet weak var gender1: UIImageView!
    @IBOutlet weak var name1: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var rate1: UIImageView!
    
    
    @IBOutlet weak var name2: UITextField!
    @IBOutlet weak var email3: UITextField!
    @IBOutlet weak var school4: UITextField!
    @IBOutlet weak var education: UITextField!
    @IBOutlet weak var subject6: UITextField!
    @IBOutlet weak var description7: UITextView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getCurrentUser();
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        // #warning Incomplete implementation, return the number of rows
        return 7
        
    }
    
    func getCurrentUser() {
        BackendUtilities.sharedInstance.studentsRepo.findCurrentUserWithSuccess({ (curr) -> Void in
            NSLog("Found user")
            if let _ = curr    {
                self.currentUser = curr as! Student
                self.loadUserInformation()
            }
            else    {
            }
        }) { (error: NSError!) -> Void in
            NSLog("Error fetching current user")
        }
    }

    
    func loadUserInformation(){
        
        if (currentUser.gender == "Male")
        {
            gender1.image = UIImage(named:"male")
        }
        else
        {
            gender1.image = UIImage(named:"female")
        }
        
        name1.text = currentUser.name    // cannot be changed
        rate1.image = UIImage(named:"emptystart")   //cannot be changed
        name2.text = currentUser.name
        email3.text = currentUser.email
        school4.text = currentUser.university
        education.text = currentUser.degree
        subject6.text = currentUser.major
        description7.text = currentUser.descriptions
    }
    
    
    @IBAction func Update(sender: UIButton) {
        self.currentUser.name = name2.text
        self.currentUser.email = email3.text
        self.currentUser.degree = education.text
        self.currentUser.university = school4.text
        self.currentUser.descriptions = description7.text
        self.currentUser.major = subject6.text
        self.currentUser.saveWithSuccess({ () -> Void in
            NSLog("sucessfully saved")
            self.loadUserInformation()
            }, failure: { (error: NSError!) -> Void in
                NSLog("error saving")
        })
    }
    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
