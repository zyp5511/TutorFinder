//
//  MainPageTableViewController.swift
//  tutorFinder
//
//  Created by Zihan Zhang on 4/4/16.
//  Copyright © 2016 ZhangYipeng. All rights reserved.
//

import UIKit
import LoopBack

class TutorTableViewController: UITableViewController {
    
    var students = [Student]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        BackendUtilities.sharedInstance.studentsRepo.allWithSuccess({ (fetchedStudents: [AnyObject]!) -> () in
            self.students = fetchedStudents as! [Student]
            self.tableView.reloadData()
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
        
        let object = students[indexPath.row] as Student
        
        let rating = object.rating
       
        if (rating == nil){
            cell.rating1.image = UIImage(named: "emptystart.png")
            cell.rating2.image = UIImage(named: "emptystart.png")
            cell.rating3.image = UIImage(named: "emptystart.png")
            cell.rating4.image = UIImage(named: "emptystart.png")
            cell.rating5.image = UIImage(named: "emptystart.png")
            
        }
        else {
        if (rating == 0 ){
            cell.rating1.image = UIImage(named: "emptystart.png")
        }
        else if (rating == 5){
           cell.rating1.image = UIImage(named:"halfstart.png")
        }
        else {
            cell.rating1.image = UIImage(named:"fullstar.png")
        }
        
        if (rating <= 1 ){
            cell.rating2.image = UIImage(named: "emptystart.png")
        }
        else if (rating == 5){
            cell.rating2.image = UIImage(named:"halfstart.png")
        }
        else {
            cell.rating2.image = UIImage(named:"fullstar.png")
        }
        
        if (rating <= 2 ){
            cell.rating3.image = UIImage(named: "emptystart.png")
        }
        else if (rating == 5){
            cell.rating3.image = UIImage(named:"halfstart.png")
        }
        else {
            cell.rating3.image = UIImage(named:"fullstar.png")
        }
        
        if (rating <= 3 ){
            cell.rating4.image = UIImage(named: "emptystart.png")
        }
        else if (rating == 5){
            cell.rating4.image = UIImage(named:"halfstart.png")
        }
        else {
            cell.rating4.image = UIImage(named:"fullstar.png")
        }
        
        if (rating <= 4 ){
            cell.rating5.image = UIImage(named: "emptystart.png")
        }
        else if (rating == 5){
            cell.rating5.image = UIImage(named:"halfstart.png")
        }
        else {
            cell.rating5.image = UIImage(named:"fullstar.png")
        }
        }
        
        cell.name.text = object.name as String
    
        cell.availability.text = object.email  as String
        
        return cell
        
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
