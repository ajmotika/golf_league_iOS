//
//  ScorecardHoleTableViewCell.swift
//  Golf League
//
//  Created by Andrew Motika on 12/21/17.
//  Copyright © 2017 Andrew Motika. All rights reserved.
//

import UIKit

protocol HoleTableViewCellDelegate: class {
    func setNextHole()
}

class HoleTableViewCell: UITableViewCell, RoundHoleDelegate {

    //MARK: Storyboard Properties
    @IBOutlet weak var holeNumberLabel: UILabel!
    @IBOutlet weak var parLabel: UILabel!
    @IBOutlet weak var yardageLabel: UILabel!
    @IBOutlet weak var strokesLabel: UILabel!
    @IBOutlet weak var strokesStackView: UIStackView!
    @IBOutlet weak var addStrokeButton: UIButton!
    @IBOutlet weak var removeStrokeButton: UIButton!
    @IBOutlet weak var doneWithHoleButton: UIButton!
    
    //MARK: Properties
    var roundHole: RoundHole!
    weak var delegate: HoleTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
//        print(inEditMode)
//        if inEditMode {
//            removeEditStrokesButtons()
//        } else {
//            addEditStrokesButtons()
//        }
        // Configure the view for the selected state
    }
    
    //MARK: Init methods
    func setProperties(using hole: RoundHole, delegate: HoleTableViewCellDelegate) {
        self.roundHole = hole
        self.roundHole.delegate = self
        self.holeNumberLabel.text = String(self.roundHole.number)
        self.parLabel.text = String(self.roundHole.par)
        self.yardageLabel.text = String(self.roundHole.yardage)
        self.delegate = delegate
        
        updateStrokesLabel()
        if !self.roundHole.isCurrent {
            removeEditStrokesButtons()
        }
    }

    //MARK: Actions
    @IBAction func addStroke(_ sender: Any) {
        roundHole.strokes += 1
        updateStrokesLabel()
    }
    
    @IBAction func removeStroke(_ sender: Any) {
        if roundHole.strokes <= 0 {
            roundHole.strokes = 0
        } else {
            roundHole.strokes = roundHole.strokes - 1
        }
        updateStrokesLabel()
    }
    
    @IBAction func finishHole(_ sender: Any) {
        removeEditStrokesButtons()
        delegate?.setNextHole()
    }
    
    //MARK: RoundHoleDelegate Method
    func makeEditable() {
        addEditStrokesButtons()
    }
    
    //MARK: Private Methods
    private func updateStrokesLabel() {
        self.strokesLabel.text = String(roundHole.strokes)
    }
    
    private func removeEditStrokesButtons() {
        strokesStackView.removeArrangedSubview(addStrokeButton)
        strokesStackView.removeArrangedSubview(removeStrokeButton)
        strokesStackView.removeArrangedSubview(doneWithHoleButton)
        addStrokeButton.isHidden = true
        removeStrokeButton.isHidden = true
        doneWithHoleButton.isHidden = true
    }
    
    private func addEditStrokesButtons() {
        strokesStackView.addArrangedSubview(addStrokeButton)
        strokesStackView.addArrangedSubview(removeStrokeButton)
        strokesStackView.addArrangedSubview(doneWithHoleButton)
        addStrokeButton.isHidden = false
        removeStrokeButton.isHidden = false
        doneWithHoleButton.isHidden = false
    }
}
