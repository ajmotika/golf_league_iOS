//
//  ScorecardHoleTableViewCell.swift
//  Golf League
//
//  Created by Andrew Motika on 12/21/17.
//  Copyright © 2017 Andrew Motika. All rights reserved.
//

import UIKit

class HoleTableViewCell: UITableViewCell {

    //MARK: Properties
    @IBOutlet weak var holeNumberLabel: UILabel!
    @IBOutlet weak var parLabel: UILabel!
    @IBOutlet weak var yardageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setProperties(using hole: Hole) {
        self.holeNumberLabel.text = String(hole.number)
        self.parLabel.text = String(hole.par)
        self.yardageLabel.text = String(hole.yardage)
    }

}
