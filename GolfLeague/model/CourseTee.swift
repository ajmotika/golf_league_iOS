//
//  CourseTee.swift
//  Golf League
//
//  Created by Andrew Motika on 12/21/17.
//  Copyright © 2017 Andrew Motika. All rights reserved.
//

import UIKit

class CourseTee {
    //MARK: Properties
    var color: UIColor
    var rating: Float
    var slope: UInt8
    var nines = [NineHoles]()

    //MARK: Initializers
    init(color: UIColor, rating: Float, slope: UInt8, frontNine: NineHoles, backNine: NineHoles) {
        self.color = color
        self.rating = rating
        self.slope = slope
        self.nines.insert(frontNine, at: 0)
        self.nines.insert(backNine, at: 1)
    }
    
    init(color: UIColor, rating: Float, slope: UInt8, frontNine: NineHoles) {
        self.color = color
        self.rating = rating
        self.slope = slope
        self.nines.insert(frontNine, at: 0)
    }
    
    subscript(holeNum: Int) -> Hole? {
        get {
            let nineNumber = holeNum/9
            if nineNumber > nines.count {
                return nil
            }
            return nines[nineNumber][holeNum % 9]
        }
    }
}
