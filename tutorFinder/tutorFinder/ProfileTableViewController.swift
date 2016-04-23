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
    @IBOutlet weak var rate1: UIImageView!
    @IBOutlet weak var name2: UILabel!
    @IBOutlet weak var email3: UILabel!
    @IBOutlet weak var school4: UILabel!
    @IBOutlet weak var education5: UILabel!
    @IBOutlet weak var subject6: UILabel!
    
    @IBOutlet weak var social7a: UIImageView!
    @IBOutlet weak var social7b: UIImageView!
    @IBOutlet weak var social7c: UIImageView!
    @IBOutlet weak var availability8: UITextView!
    @IBOutlet weak var description9: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name2.text = student.name
        if (student.gender == "male")
        {
            gender1.image = UIImage(named:"male.jpeg")
        }
        else
        {
            gender1.image = UIImage(named:"female.png")
        }
        email3.text = student.email
        education5 = student.degree
        description9 = student.description1
        availability8 = student.avaliability
        let rating = student.rating
        
        
        if (rating == nil)
        {
            cell.rating1.image = UIImage(named: "emptystart.png")
            cell.rating2.image = UIImage(named: "emptystart.png")
            cell.rating3.image = UIImage(named: "emptystart.png")
            cell.rating4.image = UIImage(named: "emptystart.png")
            cell.rating5.image = UIImage(named: "emptystart.png")
            
        }
        else
        {
            if (rating == 0 )
            {
                cell.rating1.image = UIImage(named: "emptystart.png")
            }
            else if (rating == 5)
            {
                cell.rating1.image = UIImage(named:"halfstart.png")
            }
            else
            {
                cell.rating1.image = UIImage(named:"fullstar.png")
            }
            
            if (rating <= 1 )
            {
                cell.rating2.image = UIImage(named: "emptystart.png")
            }
            else if (rating == 5)
            {
                cell.rating2.image = UIImage(named:"halfstart.png")
            }
            else
            {
                cell.rating2.image = UIImage(named:"fullstar.png")
            }
            
            if (rating <= 2 )
            {
                cell.rating3.image = UIImage(named: "emptystart.png")
            }
            else if (rating == 5)
            {
                cell.rating3.image = UIImage(named:"halfstart.png")
            }
            else
            {
                cell.rating3.image = UIImage(named:"fullstar.png")
            }
            
            if (rating <= 3 )
            {
                cell.rating4.image = UIImage(named: "emptystart.png")
            }
            else if (rating == 5)
            {
                cell.rating4.image = UIImage(named:"halfstart.png")
            }
            else
            {
                cell.rating4.image = UIImage(named:"fullstar.png")
            }
            
            if (rating <= 4 )
            {
                cell.rating5.image = UIImage(named: "emptystart.png")
            }
            else if (rating == 5)
            {
                cell.rating5.image = UIImage(named:"halfstart.png")
            }
            else
            {
                cell.rating5.image = UIImage(named:"fullstar.png")
            }
        }
        
        
        
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
