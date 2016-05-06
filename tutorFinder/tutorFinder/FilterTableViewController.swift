//
//  FilterTableViewController.swift
//  tutorFinder
//
//  Created by Zihan Zhang on 4/4/16.
//  Copyright © 2016 ZhangYipeng. All rights reserved.
//

import UIKit

class FilterTableViewController: UITableViewController{

    @IBOutlet weak var done: UIButton!
    let col1 = ["Distance", "gender","degree","major"]
    var col2 = [["< 10 Miles", "< 50 Miles", "< 100 Miles", "> 100 Miles"],
                ["Female", "Male", "Unknown" ],
                ["Ph.D", "Master", "Bachelor"],
                ["CS","Electrical Engineer"]]

    var value = [0,0,0,0]    //distance, gender, degree, major
    // initialize
    var filter: [String : String] = [ "Distance" : "< 10 Miles", "gender" : "Female", "degree" : "Ph.D" ,"major" : "empty" ]
    
    var pictures = ["dis", "gen", "edu","fie"]
    // MARK: - Table view data source

    override func viewDidLoad() {
        setupMajorlist()
        super.viewDidLoad()
        
        let button = UIButton(type: .Custom)
        button.frame = CGRectMake(160, 100, 50, 50)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        
        
        self.navigationController?.navigationBar.barStyle = UIBarStyle.Black
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        

    }
    
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
        
        cell.pic?.image = UIImage(named:pictures[indexPath.row])
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
            value[valuePicker.category] = col2[valuePicker.category].indexOf(selectedValue)! ;
            filter[col1[0]] = col2[0][value[0]]
            filter[col1[1]] = col2[1][value[1]]
            filter[col1[2]] = col2[2][value[2]]
            filter[col1[3]] = col2[3][value[3]]
            if (filter[col1[3]] == "(empty)"){
                filter[col1[3]] = ""
            }
            print("slected major is ", filter[col1[3]])
            self.tableView.reloadData()
        }
    }

    
    func setupMajorlist() {
        
        do {
            guard let path = NSBundle.mainBundle().pathForResource("majorlist", ofType: "txt") else {
                print("path is wrong\n")
                return
            }
            let text = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
            col2[3] = text.componentsSeparatedByString("\n")
            // print("size of List is ", majorList.count)
        }catch _ as NSError {
            print("picker is wrong")
        }
    }
}