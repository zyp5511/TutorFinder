//
//  EditingTableViewController.swift
//  tutorFinder
//
//  Created by Zihan Zhang on 4/4/16.
//  Copyright © 2016 ZhangYipeng. All rights reserved.
//

import UIKit

class EditingTableViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var currentUser: Student = Student()

    @IBOutlet weak var gender1: UIImageView!
    @IBOutlet weak var name1: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    
    @IBOutlet weak var rating5: UIImageView!
    @IBOutlet weak var rating1: UIImageView!
    @IBOutlet weak var rating2: UIImageView!
    @IBOutlet weak var rating4: UIImageView!
    
    @IBOutlet weak var rating3: UIImageView!
    @IBOutlet weak var name2: UITextField!
    @IBOutlet weak var email3: UITextField!
    @IBOutlet weak var school4: UITextField!
    @IBOutlet weak var education: UITextField!
   // @IBOutlet weak var subject6: UITextField!
    @IBOutlet weak var description7: UITextView!
    @IBOutlet weak var subject: UIPickerView!
    
    var majorList : [String] = ["A","B"]
    var chosenMajor = "(empty)"
    
    override func viewDidLoad() {
        setupMajorlist()
        super.viewDidLoad()
        subject.dataSource = self
        subject.delegate = self


        //subject.selectedRowInComponent(majorList.indexOf(chosenMajor)!)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func viewDidAppear(animated: Bool){
        super.viewDidAppear(animated)
        //setupMajorlist()
        getCurrentUser()
        description7.layer.borderColor = UIColor(red:128/255, green: 128/255, blue: 128/255,alpha:1).CGColor
        description7.layer.borderWidth = CGFloat(Float(1.0))
        description7.layer.cornerRadius = CGFloat(Float(5.0))
        
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
        
        name1.text = currentUser.username    // cannot be changed
        name2.text = currentUser.name
        email3.text = currentUser.email
        school4.text = currentUser.university
        education.text = currentUser.degree
        description7.text = currentUser.descriptions
        chosenMajor = currentUser.major
        
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
    
    
    
    @IBAction func Update(sender: UIButton) {
        
        let temp2 = self.currentUser.username
        let temp = self.currentUser.email
        self.currentUser.name = name2.text
        self.currentUser.username = "test"
        self.currentUser.email = "test@gmail.com"
        self.currentUser.degree = education.text
        self.currentUser.university = school4.text
        self.currentUser.descriptions = description7.text
        self.currentUser.major = chosenMajor
     
        self.currentUser.saveWithSuccess({ () -> Void in
            NSLog("sucessfully saved")
            self.loadUserInformation()
            }, failure: { (error: NSError!) -> Void in
                NSLog("error")
        })
        
        
        
        self.currentUser.email = temp
        self.currentUser.username = temp2
        self.currentUser.saveWithSuccess({ () -> Void in
            NSLog("sucessfully saved")
            self.loadUserInformation()
            }, failure: { (error: NSError!) -> Void in
                NSLog(error.description)
        })
        
        
       // print("SUccess Changed")
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
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

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return majorList.count
    }
    //MARK: Delegates
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return majorList[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        chosenMajor = majorList[row]
    }
    
    //size
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 250
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        let titleData = majorList[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 15.0)!,NSForegroundColorAttributeName:UIColor.blackColor()])
        pickerLabel.attributedText = myTitle
        return pickerLabel
    }
    
    func setupMajorlist() {

        do {
            guard let path = NSBundle.mainBundle().pathForResource("majorlist", ofType: "txt") else {
                print("path is wrong\n")
                return
            }
            let text = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
            majorList = text.componentsSeparatedByString("\n")
           // print("size of List is ", majorList.count)
        } catch _ as NSError {
            print("picker is wrong")
        }
    
    }

}
