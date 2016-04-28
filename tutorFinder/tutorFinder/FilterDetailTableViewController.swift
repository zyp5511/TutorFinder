//
//  FilterDetailTableViewController.swift
//  tutorFinder
//
//  Created by D.O. on 4/17/16.
//  Copyright © 2016 ZhangYipeng. All rights reserved.
//

import UIKit

class FilterDetailTableViewController: UITableViewController {
    
    var category = 0;
    var rowNum = 0;
    var details = [["< 10 Miles", "< 50 Miles", "< 100 Miles", "> 100 Miles"],
                ["Female", "Male", "Unknown" ],
                ["Ph.D", "Master", "Bachelor"],
                ["CS","Electrical Engineer"]]
    var selectedValueIndex: Int?
    
    var selectedValue : String? {
        didSet{
            if let value = selectedValue{
                selectedValueIndex = details[category].indexOf(value)!
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        switch(category){
            case 0: rowNum = 4;
            case 1: rowNum = 3;
            case 2: rowNum = 3;
            case 3: rowNum = 2;
            default: rowNum = 0;
        }
        return rowNum
    }

    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("filterDetail")!
        cell.textLabel?.text = details[category][indexPath.row]
        
        if indexPath.row == selectedValueIndex{
            cell.accessoryType = .Checkmark
        }else {
            cell.accessoryType = .None
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        //Other row is selected - need to deselect it
        if let index = selectedValueIndex{
            let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: index, inSection: 0))
            cell?.accessoryType = .None
        }

        selectedValue = details[category][indexPath.row]
        
        //update the checkmark for the current row
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.accessoryType = .Checkmark
    }
    
   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "filterBack" {
            if let cell = sender as? UITableViewCell {
                let indexPath = tableView.indexPathForCell(cell)
                if let index = indexPath?.row {
                    selectedValue = details[category][index]
                    selectedValueIndex = index
                   // category = category
                  //  print("Selected Number",selectedValueIndex)
                   // print("Selected Value", selectedValue)
                }
            }
        }
    }
    

}
