//
//  StudentsRepo.swift
//  tutorFinder
//
//  Created by D.O. on 4/17/16.
//  Copyright © 2016 ZhangYipeng. All rights reserved.
//

import Foundation
import LoopBack

class StudentsRepo : LBPersistedModelRepository     {
    override init() {
        super.init(className: "students")
    }
    class func repository() -> StudentsRepo {
        return StudentsRepo()
    }
}