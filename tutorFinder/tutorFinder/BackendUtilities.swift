//
//  BackendUtilities.swift
//  tutorFinder
//
//  Created by D.O. on 4/23/16.
//  Copyright © 2016 ZhangYipeng. All rights reserved.
//

import Foundation
import LoopBack

class BackendUtilities  {
    let appDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate!)
    let DEFAULTS_CURRENT_USER_ID_KEY: String = "LBUserRepositoryCurrentUserId"
    var adapter: LBRESTAdapter
    var studentsRepo: StudentsRepo
    
    static let sharedInstance = BackendUtilities()
    
    init() {
        adapter = appDelegate.adapter as LBRESTAdapter!
        studentsRepo = adapter.repositoryWithClass(StudentsRepo) as! StudentsRepo
    }
    
}