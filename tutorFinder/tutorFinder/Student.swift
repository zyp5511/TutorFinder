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
    var description1: String!
    //var location: NSObject!  //not sure dictionary?
    
    //   "lat": 0,
    //   "lng": 0
    var gender: String!
    var tutor: Bool!
    var rating: Double!
    var name: String!
    
    // realm, username, credential, chanllege, emailVerified,email, status, created, lastUpdated, id
    // are all include in LBUser
}
 