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
              //  var error: NSError?
                
                // array of dictionary
                var studentData = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as? Array
                // initialize as empty array of element Student
                var studs = [Student]()
                for stud in studentData{
                    let stud = studentData(data: student as NSDictionary) // pull information for each student
                    studs.append(stud)
                }
                
                
                
            }
        }
        task.resume()
    }


}