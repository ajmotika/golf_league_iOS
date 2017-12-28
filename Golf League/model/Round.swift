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
    var holes = [RoundHole]()
    var score: Int {
        get {
            return 2
        }
    }
    
    //MARK: Initializers
    init?(_ tee: CourseTee, nines: [Int]) {
        if tee.nines.isEmpty {
            return nil
        }
        
        let numNines = tee.nines.count
        self.tee = tee
        self.date = Date()
        // Load Holes
        for (_, nine) in nines.enumerated() {
            if numNines < nine {
                return nil
            }
            for (_, hole) in tee.nines[nine].holes().enumerated() {
                holes.append(RoundHole(hole: hole))
            }
        }
        self.holes[0].isCurrent = true
    }
    
    convenience init?(frontNineOf tee: CourseTee) {
        self.init(tee, nines: [0])
    }
    
    convenience init?(backNineOf tee: CourseTee) {
        self.init(tee, nines: [1])
    }
    
    //MARK: Methods
    func incrementHole() {
        for (holeIdx, hole) in holes.enumerated() {
            let nextHoleIdx = holeIdx + 1
            if hole.isCurrent && nextHoleIdx < holes.count {
                hole.isCurrent = false
                holes[nextHoleIdx].isCurrent = true
                break
            }
        }
    }
}
