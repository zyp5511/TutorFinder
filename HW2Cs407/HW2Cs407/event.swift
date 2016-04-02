//
//  event.swift
//  HW2Cs407
//
//  Created by ZhangYipeng on 16/3/11.
//  Copyright © 2016年 ZhangYipeng. All rights reserved.
//


import Foundation
import CoreData


class Event : NSObject {
    
    var date: String
    var title: String
    
    init(withTitle t: String, andDate d : String){
        title = t
        date = d
    }
    
    init(withCoder coder:NSCoder){
        date = coder.decodeObjectForKey("date") as! String
        title = coder.decodeObjectForKey("title") as! String
    }
    
    func encodeWithCoder(coder:NSCoder){
        coder.encodeObject(date,forKey: "date")
        coder.encodeObject(title,forKey: "title")
        
    }
    
    
    
}