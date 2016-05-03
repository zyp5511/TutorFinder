//
//  UserProfileTableViewController.swift
//  tutorFinder
//
//  Created by Zihan Zhang on 4/28/16.
//  Copyright © 2016 ZhangYipeng. All rights reserved.
//

import UIKit

class UserProfileTableViewController: UITableViewController {
    var email = String()
    var student = Student()
    
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var userEmail: UILabel!
    
    @IBOutlet weak var userSchool: UILabel!
    
    @IBOutlet weak var userEducation: UILabel!
    
    @IBOutlet weak var userSubject: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userName.text = student.name
        userEmail.text = student.email
        userSchool.text = student.university
        userSchool.text = student.degree
        userSchool.text = student.major
        print(email)
        
    }


}
