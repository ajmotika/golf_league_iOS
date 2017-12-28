//
//  RoundHole.swift
//  Golf League
//
//  Created by Andrew Motika on 12/27/17.
//  Copyright © 2017 Andrew Motika. All rights reserved.
//

import Foundation

protocol RoundHoleDelegate: class {
    func makeEditable()
}

class RoundHole : Hole {
    
    //MARK: Properties
    var strokes: Int
    var isCurrent: Bool {
        didSet {
            if isCurrent {
                delegate?.makeEditable()
            }
        }
    }
    weak var delegate: RoundHoleDelegate?
    
    //MARK: Init
    init(hole: Hole, isCurrent: Bool) {
        self.strokes = 0
        self.isCurrent = isCurrent
        super.init(hole: hole)
    }
    
    convenience override init(hole: Hole) {
        self.init(hole: hole, isCurrent: false)
    }
    
}
