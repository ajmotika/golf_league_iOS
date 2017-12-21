//
//  Golfer.swift
//  Golf League
//
//  Created by Andrew Motika on 12/21/17.
//  Copyright © 2017 Andrew Motika. All rights reserved.
//

import Foundation

class Golfer {
    
    //MARK: Properties
    var firstName: String
    var lastName: String
    var emailAddress: String?
    var phoneNumber: u_long?
    
    //MARK: Initialization
    init(firstName : String, lastName: String, emailAddress: String?, phoneNumber: u_long?) {
        self.firstName = firstName
        self.lastName = lastName
        self.emailAddress = emailAddress
        self.phoneNumber = phoneNumber
    }
}
