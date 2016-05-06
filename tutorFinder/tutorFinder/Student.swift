//
//  Students.swift
//  tutorFinder
//
//  Created by D.O. on 4/17/16.
//  Copyright © 2016 ZhangYipeng. All rights reserved.
//

import Foundation
import LoopBack


class Student : LBUser {

    var degree: String!
    var descriptions: String!
    var location: CLLocation!  //not sure dictionary?
    var gender: String!
    var tutor: NSNumber!  //bool
    var rating: NSNumber! // Num
    var name: String!
    var availability : String!
    var username : String!
    var university : String!
    var securityQuestion : String!
    var securityAnswer : String!
    var major: String!
    var distance: CLLocationDistance!
    //  var realm: String!
    //  var status : String!
    //credential, chanllege, emailVerified,email, created, lastUpdated, id
    // are all include in LBUser

    
}



 