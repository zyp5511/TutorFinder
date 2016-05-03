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
    
    @IBOutlet weak var userAvailability: UITextView!
    
    @IBOutlet weak var userDescription: UITextView!
    
    @IBOutlet weak var userGender: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (student.gender == "Male")
        {
            userGender.image = UIImage(named:"male")
        }
        else
        {
            userGender.image = UIImage(named:"female")
        }

        
        userName.text = student.name
        userEmail.text = student.email
        userSchool.text = student.university
        userEducation.text = student.degree
        userSubject.text = student.major
        userAvailability.text = student.availability
        userDescription.text = student.description
        print(email)
        
    }


}
