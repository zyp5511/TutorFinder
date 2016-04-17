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
    var created: String!
    var lastUpdated: String!
    var id : Int!
    
    init(data : NSDictionary) {
        self.degree = getStringFromJSON(data, key: "degree")
      
        self.description = getStringFromJSON(data, key: "description")
        self.location = getStringFromJSON(data, key: "location")
        //   "lat": 0,
        //   "lng": 0
        self.gender = getStringFromJSON(data, key: "gender")
        self.tutor = data["tutor"] as! Bool
        
        self.rating = data["rating"] as! Int
        self.name = getStringFromJSON(data, key: "name")
        self.realm = getStringFromJSON(data, key: "realm")
        self.username = getStringFromJSON(data, key: "username");
        
 //       var credentials : [String]()!
 //       var challenges: [String]()!
        self.email = getStringFromJSON(data, key: "email");
        self.emailVerified = data["emailVerified"] as! Bool
        self.status = getStringFromJSON(data, key: "status");
        self.created = getStringFromJSON(data, key: "created");
        self.lastUpdated = getStringFromJSON(data, key: "lastUpdated");
        self.id = data["id"] as! Int
    
    }
    
    func getStringFromJSON  (data: NSDictionary, key: String)-> String{

        if let info = data[key] as? String{
            return info
        }
        return ""
    }

}