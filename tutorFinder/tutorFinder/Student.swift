//
//  Student.swift
//  tutorFinder
//
//  Created by D.O. on 4/15/16.
//  Copyright © 2016 ZhangYipeng. All rights reserved.
//

import Foundation

class Student{
    
    
    var degree: String!
    var description: String!
    var location: String!
 //   "lat": 0,
 //   "lng": 0
    var gender: String!
    var tutor: Bool!
    var rating: Int!
    var name: String!
    var realm: String!
    var username: String!
//    var credentials : [String]()!
 //   var challenges: [String]()!
    var email : String!
    var emailVerified : Bool!
    var status : String!
    var created: String
    var lastUpdated: String!
    var id : Int!
    
    init(data:NSDictionary) {
        self.degree = getStringFromJSON();
        self.description = data["description"] as! String
        self.location = data["location"] as! String
        //   "lat": 0,
        //   "lng": 0
        self.gender = data["gender"] as! String
        self.tutor = data["tutor"] as! Bool
        var rating: Int!
        var name = data["name"] as! String
        var realm = data["realm"] as! String
 //       var username =  = data["username"] as! String
 //       var credentials : [String]()!
 //       var challenges: [String]()!
        var email : String!
        var emailVerified : Bool!
        var status : String!
        var created: String
        var lastUpdated: String!
        var id : Int!
        
    }*/

}