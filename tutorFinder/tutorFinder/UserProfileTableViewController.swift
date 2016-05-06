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
        else if (student.gender == "Female")
        {
            userGender.image = UIImage(named:"female")
        }else {
            userGender.image = UIImage (named:"unknownGen")
        }

        userNameTop.text = student.username
        userName.text = student.name
        userEmail.text = student.email
        userSchool.text = student.university
        userEducation.text = student.degree
        userSubject.text = student.major
        userAvailability.text = student.availability
        userDescription.text = student.descriptions
        userAvailability.userInteractionEnabled = false
        userDescription.userInteractionEnabled = false
        
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
        userAvailability.layer.borderColor = UIColor(red:128/255, green: 128/255, blue: 128/255,alpha:1).CGColor
        userAvailability.layer.borderWidth = CGFloat(Float(1.0))
        userAvailability.layer.cornerRadius = CGFloat(Float(5.0))
        userDescription.layer.borderColor = UIColor(red:128/255, green: 128/255, blue: 128/255,alpha:1).CGColor
        userDescription.layer.borderWidth = CGFloat(Float(1.0))
        userDescription.layer.cornerRadius = CGFloat(Float(5.0))
        
    }


}
