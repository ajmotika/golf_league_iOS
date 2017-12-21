//
//  NineHoles.swift
//  Golf League
//
//  Created by Andrew Motika on 12/21/17.
//  Copyright © 2017 Andrew Motika. All rights reserved.
//

import Foundation

class NineHoles {
    
    //MARK: Properties
    let hole1: Hole
    let hole2: Hole
    let hole3: Hole
    let hole4: Hole
    let hole5: Hole
    let hole6: Hole
    let hole7: Hole
    let hole8: Hole
    let hole9: Hole
    
    //MARK: Initialization
    init(hole1: Hole, hole2 : Hole, hole3: Hole, hole4: Hole, hole5: Hole, hole6: Hole, hole7: Hole, hole8: Hole, hole9: Hole) {
        self.hole1 = hole1
        self.hole2 = hole2
        self.hole3 = hole3
        self.hole4 = hole4
        self.hole5 = hole5
        self.hole6 = hole6
        self.hole7 = hole7
        self.hole8 = hole8
        self.hole9 = hole9
    }
    
    subscript(holeNum: Int) -> Hole? {
        get {
            switch (holeNum) {
            case 0: return hole1
            case 1: return hole2
            case 2: return hole3
            case 3: return hole4
            case 4: return hole5
            case 5: return hole6
            case 6: return hole7
            case 7: return hole8
            case 8: return hole9
            default: return nil
            }
        }
    }
}
