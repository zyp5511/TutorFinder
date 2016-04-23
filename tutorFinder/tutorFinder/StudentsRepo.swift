//
//  StudentsRepo.swift
//  tutorFinder
//
//  Created by D.O. on 4/17/16.
//  Copyright © 2016 ZhangYipeng. All rights reserved.
//

import Foundation
import LoopBack

class StudentsRepo : LBUserRepository     {
    override init() {
        super.init(className: "Students")
        self.modelClass = Student.self
    }

    override init!(className name: String!) {
        super.init(className: "Students")
        self.modelClass = Student.self
    }
}