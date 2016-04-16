//
//  RestAPIManager.swift
//  tutorFinder
//
//  Created by D.O. on 4/15/16.
//  Copyright © 2016 ZhangYipeng. All rights reserved.
//

import Foundation

class RestAPIManage{
    

    
    func loadStudent (completion: ((AnyObject) ->Void)!){
        let urlString = "http://0.0.0.0:3000/api/Student"
        
        let session = NSURLSession.sharedSession()
        let studentUrl = NSURL(string:urlString)
        
        let task = session.dataTaskWithURL(studentUrl!){
            (data, response, error) -> Void in
            
            if error != nil{
                print(error?.localizedDescription)
            }
            else {
                
            }
        }
        task.resume()
    }


}