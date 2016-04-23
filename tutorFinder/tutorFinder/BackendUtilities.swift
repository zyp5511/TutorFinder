//
//  BackendUtilities.swift
//  tutorFinder
//
//  Created by D.O. on 4/23/16.
//  Copyright © 2016 ZhangYipeng. All rights reserved.
//

import Foundation


class BackendUtilities  {
    let appDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate!)
    let DEFAULTS_CURRENT_USER_ID_KEY: String = "LBUserRepositoryCurrentUserId"
    var adapter: LBRESTAdapter
    var Repo: StudentsRepo
    
    static let sharedInstance = BackendUtilities()
    
    init() {
        adapter = appDelegate.adapter as LBRESTAdapter!
        clientRepo = adapter.repositoryWithClass(StudentsRepo) as! ClientRepository
    }
    
}