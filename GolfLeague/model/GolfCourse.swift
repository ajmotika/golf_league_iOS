//
//  GolfCourse.swift
//  Golf League
//
//  Created by Andrew Motika on 12/21/17.
//  Copyright © 2017 Andrew Motika. All rights reserved.
//

import Foundation

class GolfCourse {
    //MARK: Properties
    var name: String
    var address: String
    var phoneNumber: UInt64
    var tees = [CourseTee]()
    
    //MARK: Initializers
    init(name: String, address: String, phoneNumber: UInt64) {
        self.name = name
        self.address = address
        self.phoneNumber = phoneNumber
    }
    
    
}
