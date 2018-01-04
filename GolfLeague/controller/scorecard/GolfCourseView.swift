//
//  GolfCourseView.swift
//  GolfLeague
//
//  Created by Andrew Motika on 12/31/17.
//  Copyright © 2017 Andrew Motika. All rights reserved.
//

import UIKit

class GolfCourseView: UIView {

    //MARK: Outlets
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    //MARK: Properties
    var golfCourse: GolfCourse? {
        didSet {
            courseNameLabel.text = golfCourse?.name
            addressLabel.text = golfCourse?.address
        }
    }
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
