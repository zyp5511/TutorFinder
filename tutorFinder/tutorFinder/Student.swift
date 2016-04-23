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
   //var tutor: NSNumber!  //bool
 //   var rating: NSNumber! //int
    var name: String!
   // var realm: String!
   // var username: String!
    //  var credentials : NSObject!
    // var challenges: NSObject!
   // var email : String!
   //  var emailVerified : NSNumber!  //bool
   // var status : String!
  //  var created: String!
   // var lastUpdated: String!
    //var id : NSNumber!  //int
    "realm": "string",
    "username": "string",
    "credentials": {},
    "challenges": {},
    "email": "string",
    "emailVerified": true,
    "status": "string",
    "created": "2016-04-23",
    "lastUpdated": "2016-04-23",
    "id": 0
}
 