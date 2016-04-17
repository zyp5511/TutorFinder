//
//  UserPhoto.swift
//  tutorFinder
//
//  Created by Zihan Zhang on 4/17/16.
//  Copyright © 2016 ZhangYipeng. All rights reserved.
//

import Foundation

class UserPhoto
{
    var id : Int!
    var photo : [String]!
    
    init(data:NSDictionary)
    {
        self.id = data["id"] as! Int
        self.photo = data["photo"] as! [String]!
    }
}
