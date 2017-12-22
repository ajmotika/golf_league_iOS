//
//  TeeHole.swift
//  Golf League
//
//  Created by Andrew Motika on 12/21/17.
//  Copyright © 2017 Andrew Motika. All rights reserved.
//

import Foundation

class Hole {
    
    //MARK: Properties
    var number: UInt8
    var par: UInt8
    var yardage: UInt16
    var handicap: UInt8
    
    //MARK: Initializers
    init(number: UInt8, par: UInt8, yardage: UInt16, handicap: UInt8) {
        self.number = number
        self.par = par
        self.yardage = yardage
        self.handicap = handicap
    }
    
}
