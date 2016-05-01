//
//  Message.swift
//  tutorFinder
//
//  Created by patron on 16/4/15.
//  Copyright © 2016年 ZhangYipeng. All rights reserved.
//

import Foundation

class Message{
    var sender: String!
    var receiver: String!
    var id:Int!
    
    init(data:NSDictionary) {
        self.receiver = getStringFromJSON(data, key:"receiver")
        self.sender = getStringFromJSON(data, key:"sender")
        self.id = Int(getStringFromJSON(data, key:"id"))!
    }
    
    
    func getStringFromJSON(data:NSDictionary, key:String) -> String {
        if let info = data[key] as? String{
            return info
        }
        return ""
    }
    
    
    var msgs = [Message]()
    
    let url = "http://localhost:3000/Messages"
}
