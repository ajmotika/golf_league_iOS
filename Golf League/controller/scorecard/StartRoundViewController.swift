//
//  StartRoundViewController.swift
//  Golf League
//
//  Created by Andrew Motika on 12/30/17.
//  Copyright © 2017 Andrew Motika. All rights reserved.
//

import UIKit
import os.log

class StartRoundViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var startButton: UIBarButtonItem!
    
    //MARK: Properties
    var round: Round?
    
    //MARK: UIViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === startButton else {
            os_log("The start button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        preloadRound()
    }
    
    //MARK: Private Methods
    private func preloadRound() {
        let frontNine = NineHoles(
            hole1: Hole(number: 1, par: 4, yardage: 399, handicap: 4),
            hole2: Hole(number: 2, par: 3, yardage: 173, handicap: 16),
            hole3: Hole(number: 3, par: 4, yardage: 331, handicap: 18),
            hole4: Hole(number: 4, par: 4, yardage: 368, handicap: 8),
            hole5: Hole(number: 5, par: 5, yardage: 501, handicap: 12),
            hole6: Hole(number: 6, par: 4, yardage: 329, handicap: 6),
            hole7: Hole(number: 7, par: 3, yardage: 163, handicap: 14),
            hole8: Hole(number: 8, par: 5, yardage: 518, handicap: 10),
            hole9: Hole(number: 9, par: 4, yardage: 456, handicap: 2))
        
        let backNine = NineHoles(
            hole1: Hole(number: 10, par: 4, yardage: 431, handicap: 3),
            hole2: Hole(number: 11, par: 3, yardage: 165, handicap: 13),
            hole3: Hole(number: 12, par: 4, yardage: 390, handicap: 15),
            hole4: Hole(number: 13, par: 4, yardage: 396, handicap: 11),
            hole5: Hole(number: 14, par: 5, yardage: 547, handicap: 7),
            hole6: Hole(number: 15, par: 5, yardage: 517, handicap: 9),
            hole7: Hole(number: 16, par: 4, yardage: 426, handicap: 1),
            hole8: Hole(number: 17, par: 5, yardage: 171, handicap: 17),
            hole9: Hole(number: 18, par: 4, yardage: 424, handicap: 5))
        let tee = CourseTee(color: .blue, rating: 71.0, slope: 115, frontNine: frontNine, backNine: backNine)
        round = Round(tee, nines: [1,0])
    }

}
