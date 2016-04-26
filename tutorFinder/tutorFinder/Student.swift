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
    //var location: NSObject!  //not sure dictionary?
        //   "lat": 0,
    //   "lng": 0
    var gender: String!
    var tutor: NSNumber!  //bool
    var rating: NSNumber! // Num
    var name: String!
    var avail : String!
    var username : String!
    //  var realm: String!
    //  var status : String!
    //credential, chanllege, emailVerified,email, created, lastUpdated, id
    // are all include in LBUser

    
}
 