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
    
    var currentUser: Student = Student()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BackendUtilities.sharedInstance.studentsRepo.findCurrentUserWithSuccess({ (user) -> Void in
            NSLog("Found user")
            if let _ = user    {
                self.currentUser = user as! Student
                 self.loadUserInformation()
            }
            else    {
            }
        }) { (error: NSError!) -> Void in
            NSLog("Error fetching current user")
        }
        
    }
    
    
    @IBAction func logoutButton(sender: AnyObject) {
        BackendUtilities.sharedInstance.studentsRepo.logoutWithSuccess({
            NSUserDefaults.standardUserDefaults().setValue(nil, forKey: "username")
            NSUserDefaults.standardUserDefaults().setValue(nil, forKey: "password")
            NSUserDefaults.standardUserDefaults().setBool(false, forKey: "hasLoginKey")
            self.performSegueWithIdentifier("toSignUp", sender: self)
            }
            , failure:{ (error: NSError!) -> Void in
                NSLog("Error fetching current user")
            }
        )
    
    
    }
 
    
    func loadUserInformation(){
    
        if (currentUser.gender == "Male")
        {
            gender1.image = UIImage(named:"male.jpeg")
        }
        else
        {
            gender1.image = UIImage(named:"female.png")
        }
        
        
        name1.text = currentUser.name
        name2.text = currentUser.name
        email3.text = currentUser.email
        school4.text = currentUser.university
        education5.text = currentUser.degree
        subject6.text = currentUser.major
        
        availability8.text = currentUser.availability
        description9.text = currentUser.descriptions
        
        
        
        let rating = Int(currentUser.rating)
        
        
        if (rating == 0 )
        {
            rating1.image = UIImage(named: "emptystart.png")
        }
        else if (rating == 5)
        {
            rating1.image = UIImage(named:"halfstart.png")
        }
        else
        {
            rating1.image = UIImage(named:"fullstar.png")
        }
        
        if (rating <= 1 )
        {
            rating2.image = UIImage(named: "emptystart.png")
        }
        else if (rating == 5)
        {
            rating2.image = UIImage(named:"halfstart.png")
        }
        else
        {
            rating2.image = UIImage(named:"fullstar.png")
        }
        
        if (rating <= 2 )
        {
            rating3.image = UIImage(named: "emptystart.png")
        }
        else if (rating == 5)
        {
            rating3.image = UIImage(named:"halfstart.png")
        }
        else
        {
            rating3.image = UIImage(named:"fullstar.png")
        }
        
        if (rating <= 3 )
        {
            rating4.image = UIImage(named: "emptystart.png")
        }
        else if (rating == 5)
        {
            rating4.image = UIImage(named:"halfstart.png")
        }
        else
        {
            rating4.image = UIImage(named:"fullstar.png")
        }
        
        if (rating <= 4 )
        {
            rating5.image = UIImage(named: "emptystart.png")
        }
        else if (rating == 5)
        {
            rating5.image = UIImage(named:"halfstart.png")
        }
        else
        {
            rating5.image = UIImage(named:"fullstar.png")
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
    

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...
        //border ajustment
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.darkGrayColor().CGColor
        border.frame = CGRect(x: 0, y: cell.frame.size.height - width, width: cell.frame.size.width, height: cell.frame.size.height)
        
        border.borderWidth = width
        cell.layer.addSublayer(border)
        cell.layer.masksToBounds = true
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
