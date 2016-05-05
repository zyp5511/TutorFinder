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
    
    @IBOutlet weak var userNameTop: UILabel!
    @IBOutlet weak var useravatar: UIImageView!
    @IBOutlet weak var userGender: UIImageView!
    
    
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var userEmail: UILabel!
    
    @IBOutlet weak var userSchool: UILabel!
    
    @IBOutlet weak var userEducation: UILabel!
    
    @IBOutlet weak var userSubject: UILabel!
    
    @IBOutlet weak var userAvailability: UITextView!
    
    @IBOutlet weak var userDescription: UITextView!
    
    @IBOutlet weak var rating1: UIImageView!
    
    @IBOutlet weak var rating2: UIImageView!
    
    @IBOutlet weak var rating3: UIImageView!
    
    @IBOutlet weak var rating4: UIImageView!
    
    @IBOutlet weak var rating5: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (student.gender == "Male")
        {
            userGender.image = UIImage(named:"male")
        }
        else if (student.gender == "female")
        {
            userGender.image = UIImage(named:"female")
        }else {
            userGender.image = UIImage (named:"unknownGen")
        }

        userNameTop.text = student.name
        userName.text = student.name
        userEmail.text = student.email
        userSchool.text = student.university
        userEducation.text = student.degree
        userSubject.text = student.major
        userAvailability.text = student.availability
        userDescription.text = student.descriptions
        
        
        let rating = Int(student.rating)
        
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

        print(email)
        
    }


}
