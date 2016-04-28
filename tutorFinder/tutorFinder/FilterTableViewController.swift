//
//  FilterTableViewController.swift
//  tutorFinder
//
//  Created by Zihan Zhang on 4/4/16.
//  Copyright © 2016 ZhangYipeng. All rights reserved.
//

import UIKit

class FilterTableViewController: UITableViewController{

    
    let col1 = ["Distance", "Gender","Education","Feild"]
    let col2 = [["< 10 Miles", "< 50 Miles", "< 100 Miles", "> 100 Miles"],
                ["Female", "Male", "Unknown" ],
                ["Ph.D", "Master", "Bachelor"],
                ["CS","Electrical Engineer"]]

    var value = [0,0,0,0]    //distance, gender, degree, major
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }
    
    /*
    override func viewDidLoad() {
        self.tableView.reloadData()
    }*/
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FilterCell", forIndexPath: indexPath) as! filterCell
        
        /*border ajustment
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.darkGrayColor().CGColor
        border.frame = CGRect(x: 0, y: cell.frame.size.height - width, width: cell.frame.size.width, height: cell.frame.size.height)
        
        border.borderWidth = width
        cell.layer.addSublayer(border)
        cell.layer.masksToBounds = true
        */
        
        //value 
       // print("Postion back",value[2])
        cell.label1?.text = col1[indexPath.row];
        cell.label2?.text = col2[indexPath.row][value[indexPath.row]];
        return cell
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "filterSelect"){
            let selectedrow = self.tableView.indexPathForSelectedRow?.row
            
            if let dest = segue.destinationViewController as? FilterDetailTableViewController{
                dest.category = selectedrow!
                dest.selectedValue = col2[selectedrow!][value[selectedrow!]]
                print( "category:" , col2[selectedrow!][value[selectedrow!]], "\n")
            }
        }
    }
    
    @IBAction func unwindWithSelectedValue (segue:UIStoryboardSegue){
        if let valuePicker = segue.sourceViewController as? FilterDetailTableViewController,
            selectedValue = valuePicker.selectedValue {
           // print("Change to", selectedValue)
            //print("Cate changed to",valuePicker.category )
           // print("Lcoation is ", col2[valuePicker.category].indexOf(selectedValue)!)
            value[valuePicker.category] = col2[valuePicker.category].indexOf(selectedValue)! ;
            self.tableView.reloadData()
        }
        
    
    
    }

    
}
