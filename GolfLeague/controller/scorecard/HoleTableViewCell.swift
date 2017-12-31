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
    var roundHole: RoundHole?
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
        
        let rh = unpackRoundHole()
        
        rh.delegate = self
        self.holeNumberLabel.text = String(rh.number)
        self.parLabel.text = String(rh.par)
        self.yardageLabel.text = String(rh.yardage)
        self.delegate = delegate
        
        updateStrokesLabel()
        if !rh.isCurrent {
            removeEditStrokesButtons()
        } else {
            addEditStrokesButtons()
        }
    }

    //MARK: Actions
    @IBAction func addStroke(_ sender: Any) {
        let rh = unpackRoundHole()
        rh.strokes += 1
        updateStrokesLabel()
    }
    
    @IBAction func removeStroke(_ sender: Any) {
        let rh = unpackRoundHole()
        if rh.strokes <= 0 {
            rh.strokes = 0
        } else {
            rh.strokes = rh.strokes - 1
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
    private func unpackRoundHole() -> RoundHole {
        guard let rh = self.roundHole else {
            fatalError("Must pass in hole")
        }
        return rh
    }
    
    private func updateStrokesLabel() {
        let rh = unpackRoundHole()
        self.strokesLabel.text = String(rh.strokes)
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
