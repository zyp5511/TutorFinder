//
//  StudentRepository.swift
//  tutorFinder
//
//  Created by patron on 16/4/19.
//  Copyright © 2016年 ZhangYipeng. All rights reserved.
//

import Foundation
import LoopBack

class StudentsRepository : LBUserRepository     {
    override init() {
        super.init(className: "Students")
        self.modelClass = Student.self
    }
    
    override init!(className name: String!) {
        super.init(className: "Students")
        self.modelClass = Student.self
    }
}
    
