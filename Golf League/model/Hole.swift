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
    var number: Int
    var par: Int
    var yardage: Int
    var handicap: Int
    
    //MARK: Initializers
    init(number: Int, par: Int, yardage: Int, handicap: Int) {
        self.number = number
        self.par = par
        self.yardage = yardage
        self.handicap = handicap
    }
    
    init(hole: Hole) {
        self.number = hole.number
        self.par = hole.par
        self.yardage = hole.yardage
        self.handicap = hole.handicap
    }
    
}
