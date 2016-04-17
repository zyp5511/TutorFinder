//
//  Students.swift
//  tutorFinder
//
//  Created by D.O. on 4/17/16.
//  Copyright © 2016 ZhangYipeng. All rights reserved.
//

import Foundation
import LoopBack


class Students : LBPersistedModel {

    var degree: String!
    var description1: String!
    var location: String!
    //   "lat": 0,
    //   "lng": 0
    var gender: String!
    var tutor: NSNumber!  //bool
    var rating: NSNumber! //int
    var name: String!
    var realm: String!
    var username: String!
    //    var credentials : [String]()!
    //   var challenges: [String]()!
    var email : String!
    var emailVerified : NSNumber!  //bool
    var status : String!
    var created: String!
    var lastUpdated: String!
    var id : NSNumber!  //int
}
 