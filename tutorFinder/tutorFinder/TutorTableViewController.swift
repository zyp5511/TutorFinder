//
//  MainPageTableViewController.swift
//  tutorFinder
//
//  Created by Zihan Zhang on 4/4/16.
//  Copyright © 2016 ZhangYipeng. All rights reserved.
//

import UIKit
import LoopBack
import LocalAuthentication

class TutorTableViewController: UITableViewController {
    
    var students = [Student]()
    
    var isAuthenticated = false
    var context = LAContext()
    let DefaultUsername = NSUserDefaults.standardUserDefaults().stringForKey("username") as String!
    
    //var managedObjectContext: NSManagedObjectContext? = nil
    //var _fetchedResultsController: NSFetchedResultsController? = nil
    
    var didReturnFromBackground = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.alpha = 0
        if (isAuthenticated == true){
        }
    }
    
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        isAuthenticated = true
        view.alpha = 1.0
    }
    
    func appWillResignActive(notification : NSNotification) {
        
        view.alpha = 0
        isAuthenticated = false
        didReturnFromBackground = true
    }
    
    func appDidBecomeActive(notification : NSNotification) {
        
        if didReturnFromBackground {
            self.showLoginView()
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        self.showLoginView()
    }
    
    
    func showLoginView() {
        
        if !isAuthenticated {
            self.performSegueWithIdentifier("loginView", sender: self)
        }
        else {
            BackendUtilities.sharedInstance.studentsRepo.allWithSuccess({ (fetchedStudents: [AnyObject]!) -> () in
                self.students = fetchedStudents as! [Student]
                self.tableView.reloadData()
                }, failure: { (error: NSError!) -> Void in
                    NSLog(error.description)
            })
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
        // #warning Incomplete implementation, return the number of rows
        return students.count
    }
    
    
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("tutor", forIndexPath: indexPath) as! TutorTableViewCell
        
        let object = students[indexPath.row] as Student!
    
         NSLog(String(object))
        
        let rate = object.rating
        let rating = Int(rate)
        
        //let userEmail = object.email as String
        
        /*
        // store defaultUser as type Student
        if ((userEmail == DefaultUsername) == 1 ){
            
            print("Success")
           // NSUserDefaults.standardUserDefaults().setObject(object, forKey: "currentUser")
            let userDefaults = NSUserDefaults.standardUserDefaults()
            let encodedData = NSKeyedArchiver.archivedDataWithRootObject(object)
            userDefaults.setObject(encodedData, forKey: "currentUser")
            userDefaults.synchronize()
            
            let decoded  = userDefaults.objectForKey("currentUser") as! NSData
            let decodedTeams = NSKeyedUnarchiver.unarchiveObjectWithData(decoded) as! [Student]
            print("Value get is ", decodedTeams.username)
            
                //.setValue(object, forKey: "currentUser")
         }
         print("Email is ", userEmail)
         print("Username:", DefaultUsername)
         */
        
        if rating == 0 {
            cell.rating1.image = UIImage(named: "emptystart.png")
        }
        else {
            cell.rating1.image = UIImage(named:"fullstar.png")
        }
        
        if rating <= 1 {
            cell.rating2.image = UIImage(named: "emptystart.png")
        }
        else {
            cell.rating2.image = UIImage(named:"fullstar.png")
        }
        
        if rating <= 2 {
            cell.rating3.image = UIImage(named: "emptystart.png")
        }
        else {
            cell.rating3.image = UIImage(named:"fullstar.png")
        }
        
        if rating <= 3 {
            cell.rating4.image = UIImage(named: "emptystart.png")
        }
        else {
            cell.rating4.image = UIImage(named:"fullstar.png")
        }
        
        if rating <= 4 {
            cell.rating5.image = UIImage(named: "emptystart.png")
        }
        else {
            cell.rating5.image = UIImage(named:"fullstar.png")
        }
        
        

        cell.name.text = object.username as String
        cell.availability.text = object.availability as String
        
            return cell
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        //let storyboard = UIStoryboard(name: "storyboard", bundle: nil);
        //let days = storyboard.instantiateViewControllerWithIdentifier("DaysTableViewController") as! UITableViewController
        //let destinationVC:DaysTableViewController = DaysTableViewController()
        let userProfile = indexPath.row
        self.performSegueWithIdentifier("tutorToUserProfile", sender: nil)
    }

    
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "tutorToUserProfile") {
            let vc:UserProfileViewController = segue.destinationViewController as! UserProfileViewController
            vc.id = 1        }
        
    }
    
}
