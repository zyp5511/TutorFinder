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
    let here = CLLocation(latitude:44.0731,longitude: -89.4012)
    var isAuthenticated = false
    var context = LAContext()
    let DefaultUsername = NSUserDefaults.standardUserDefaults().stringForKey("username") as String!
    var emailAdd = String()
    var clickedStudent = Student()
    var degreeDict:NSDictionary=["Bachelor":["Bachelor","Master","Ph.D"],"Master":["Master","Ph.D"],"Ph.D":"Ph.D"]
    var distanceDict:NSDictionary=["< 10 Miles":"10","< 50 Miles":"50","< 100 Miles":"100","> 100 Miles":"9999"]
    var filter: [String : String] = [:]
    var value = [0,0,0,0]
    var distance1 : Int!
    var studentID : String!
    //var managedObjectContext: NSManagedObjectContext? = nil
    //var _fetchedResultsController: NSFetchedResultsController? = nil
    
    var didReturnFromBackground = false
    
    
    
    override func viewDidLoad() {
        print("tutor")
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.students.removeAll()
        self.showLoginView()
        
        self.navigationController?.navigationBar.barStyle = UIBarStyle.Black
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        

    }
    
    /*
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        isAuthenticated = true
        print("aaaa")
        view.alpha = 1.0
    }*/
    
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
    
    
    func showLoginView() {
//        NSLog(String(BackendUtilities.sharedInstance.studentsRepo.cachedCurrentUser._id))
        
            NSLog(self.filter.description)
            let currentID = BackendUtilities.sharedInstance.studentsRepo.cachedCurrentUser._id
            let excludeSelf:NSDictionary = ["id":["neq":currentID]]
            var newFilter:NSDictionary = ["where":excludeSelf]
            if !self.filter.values.isEmpty{
                let degree:NSString = self.filter["degree"]!
                let genderFilter:NSDictionary = ["gender":self.filter["gender"]!]
                let degreeFilter:NSDictionary = ["degree":degree.lowercaseString]
                let majorFilter:NSDictionary = ["major":self.filter["major"]!]
                newFilter = ["where":["and":[genderFilter,degreeFilter,excludeSelf]],"order":"id ASC"]
            }
            NSLog(newFilter.description)
            BackendUtilities.sharedInstance.studentsRepo.findWithFilter(newFilter as [NSObject : AnyObject],
                success: { (fetchedStudents: [AnyObject]!) -> () in
                if !self.filter.values.isEmpty{
                for stu:Student in fetchedStudents as! [Student]{
                    let dist0 = Student.caclDistance(stu, location: self.here)/1000.0/1.6
                    let currDist:String = self.filter["Distance"]!
                    let distToComp:Double = Double(self.distanceDict[currDist] as! String)!
                    NSLog(distToComp.description)
                    if dist0 <= distToComp {
                        self.students.append(stu)
                    }
                }
               }else{
                    self.students = fetchedStudents as! [Student]
                }
                
                self.tableView.reloadData()
                NSLog(self.students.description)
                }, failure: { (error: NSError!) -> Void in
                    NSLog(error.description)
            })
        
        
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
    
      //   NSLog(String(object))
        
        let rate = object.rating
        let rating = Int(rate)
        let studentID = String(object._id)
        
        //let userEmail = object.email as String
        
               
        if rating == 0 {
            cell.rating1.image = UIImage(named: "emptystar")
        }
        else {
            cell.rating1.image = UIImage(named:"fullstar")
        }
        
        if rating <= 1 {
            cell.rating2.image = UIImage(named: "emptystar")
        }
        else {
            cell.rating2.image = UIImage(named:"fullstar")
        }
        
        if rating <= 2 {
            cell.rating3.image = UIImage(named: "emptystar")
        }
        else {
            cell.rating3.image = UIImage(named:"fullstar")
        }
        
        if rating <= 3 {
            cell.rating4.image = UIImage(named: "emptystar")
        }
        else {
            cell.rating4.image = UIImage(named:"fullstar")
        }
        
        if rating <= 4 {
            cell.rating5.image = UIImage(named: "emptystar")
        }
        else {
            cell.rating5.image = UIImage(named:"fullstar")
        }
        
        

        cell.name.text = object.username as String
        cell.availability.text = object.availability as String
        let currDist:Double = Student.caclDistance(object, location: here)/1000.0/1.6
        cell.distance1.text = NSString(format: "%.2f miles",currDist) as String
        if ((studentID == "1") || (studentID ==  "2") || (studentID == "3") || (studentID == "4") || (studentID == "5") || (studentID == "6") || (studentID == "7") || (studentID == "8")){
            cell.avatar.image = UIImage(named: studentID)
        }
        else {
            cell.avatar.image = UIImage(named: "default")
        }
        
        return cell
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        //let storyboard = UIStoryboard(name: "storyboard", bundle: nil);
        //let days = storyboard.instantiateViewControllerWithIdentifier("DaysTableViewController") as! UITableViewController
        //let destinationVC:DaysTableViewController = DaysTableViewController()
        let object = students[indexPath.row] as Student!
        clickedStudent = object as Student
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
            let vc:UserProfileTableViewController = segue.destinationViewController as! UserProfileTableViewController
            vc.student = clickedStudent
        }
        else if (segue.identifier == "EnterFilter"){
             let vc : FilterTableViewController = segue.destinationViewController as!
                FilterTableViewController
            vc.filter = filter
            vc.value = value
        }
        
    }
    
    
    @IBAction func unwindFromFilter (segue:UIStoryboardSegue){
        if let valuePicker = segue.sourceViewController as? FilterTableViewController{
                    filter = valuePicker.filter
                    value = valuePicker.value
                print(filter["Distance"])
        }
        
    }

    
}
