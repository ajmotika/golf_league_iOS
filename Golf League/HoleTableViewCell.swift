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
    @IBOutlet weak var strokesLabel: UILabel!
    @IBOutlet weak var strokesStackView: UIStackView!
    @IBOutlet weak var addStrokeButton: UIButton!
    
    var numStrokes: Int8 = 0
    var inEditMode = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        print(inEditMode)
        if inEditMode {
            removeEditStrokesButtons()
        } else {
            addEditStrokesButtons()
        }
        // Configure the view for the selected state
    }
    
    
    func setProperties(using hole: Hole) {
        self.holeNumberLabel.text = String(hole.number)
        self.parLabel.text = String(hole.par)
        self.yardageLabel.text = String(hole.yardage)
        updateStrokesLabel()
        
    }

    //MARK: Actions
    @IBAction func addStroke(_ sender: Any) {
        numStrokes += 1
        updateStrokesLabel()
    }
    
    
    //MARK: Private Methods
    private func updateStrokesLabel() {
        self.strokesLabel.text = String(numStrokes)
    }
    
    
    private func removeEditStrokesButtons() {
        strokesStackView.removeArrangedSubview(addStrokeButton)
        addStrokeButton.isHidden = true
        inEditMode = false
    }
    
    private func addEditStrokesButtons() {
        strokesStackView.addArrangedSubview(addStrokeButton)
        addStrokeButton.isHidden = false
        inEditMode = true
    }
}
