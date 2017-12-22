//
//  Round.swift
//  Golf League
//
//  Created by Andrew Motika on 12/21/17.
//  Copyright © 2017 Andrew Motika. All rights reserved.
//

import Foundation

class Round {
    
    //MARK: Properties
    let tee: CourseTee
    let date: Date
    var holes = [Int: (Hole, Int?)]()
    var score: Int {
        get {
            return 2
        }
    }
    
    //MARK: Initializers
    init?(_ tee: CourseTee, nines: [Int]) {
        let numNines = tee.nines.count
        for (idx, nine) in nines.enumerated() {
            if numNines < nine {
                return nil
            }
            for (holeIdx, hole) in tee.nines[nine].holes().enumerated() {
                let holeNum : Int = Int(9*idx + holeIdx + 1)
                holes[holeNum] = (hole, nil)
            }
        }
        
        self.tee = tee
        self.date = Date()
    }
    
    convenience init?(frontNineOf tee: CourseTee) {
        self.init(tee, nines: [0])
    }
    
    convenience init?(backNineOf tee: CourseTee) {
        self.init(tee, nines: [1])
    }
    
    
}
