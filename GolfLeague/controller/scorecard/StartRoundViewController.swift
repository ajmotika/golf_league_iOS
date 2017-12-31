//
//  StartRoundViewController.swift
//  Golf League
//
//  Created by Andrew Motika on 12/30/17.
//  Copyright © 2017 Andrew Motika. All rights reserved.
//

import UIKit
import os.log
import SearchTextField

class StartRoundViewController: UIViewController {
    
    
    //MARK: Outlets
    @IBOutlet weak var startButton: UIBarButtonItem!
    @IBOutlet weak var golfCoursePickerField: SearchTextField!
    
    
    //MARK: Properties
    var round: Round?
    
    //MARK: UIViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        print(golfCoursePickerField)
        let foxfireItem = SearchTextFieldItem(title: "Foxfire", subtitle: "1 mile away")
        let safariItem = SearchTextFieldItem(title: "Safari", subtitle: "2 miles away")
        let shamrockItem = SearchTextFieldItem(title: "Shamrock", subtitle: "5 miles away")
        golfCoursePickerField.filterItems([foxfireItem, safariItem, shamrockItem])
        golfCoursePickerField.startVisible = true
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
    }
    
    //MARK: Private Methods
    private func setRounds() {
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
        let blueTee = CourseTee(color: .blue, rating: 71.0, slope: 115, frontNine: frontNine, backNine: backNine)
        var foxfireGC = GolfCourse(name: "Foxfire", address: "", phoneNumber: 123456789)
        foxfireGC.tees.append(blueTee)
//        golfCourses.append(foxfireGC)
        
        let frontNineA = NineHoles(
            hole1: Hole(number: 1, par: 4, yardage: 399, handicap: 4),
            hole2: Hole(number: 2, par: 3, yardage: 173, handicap: 16),
            hole3: Hole(number: 3, par: 4, yardage: 331, handicap: 18),
            hole4: Hole(number: 4, par: 4, yardage: 368, handicap: 8),
            hole5: Hole(number: 5, par: 5, yardage: 501, handicap: 12),
            hole6: Hole(number: 6, par: 4, yardage: 329, handicap: 6),
            hole7: Hole(number: 7, par: 3, yardage: 163, handicap: 14),
            hole8: Hole(number: 8, par: 5, yardage: 518, handicap: 10),
            hole9: Hole(number: 9, par: 4, yardage: 456, handicap: 2))
        
        let backNineA = NineHoles(
            hole1: Hole(number: 10, par: 4, yardage: 431, handicap: 3),
            hole2: Hole(number: 11, par: 3, yardage: 165, handicap: 13),
            hole3: Hole(number: 12, par: 4, yardage: 390, handicap: 15),
            hole4: Hole(number: 13, par: 4, yardage: 396, handicap: 11),
            hole5: Hole(number: 14, par: 5, yardage: 547, handicap: 7),
            hole6: Hole(number: 15, par: 5, yardage: 517, handicap: 9),
            hole7: Hole(number: 16, par: 4, yardage: 426, handicap: 1),
            hole8: Hole(number: 17, par: 5, yardage: 171, handicap: 17),
            hole9: Hole(number: 18, par: 4, yardage: 424, handicap: 5))
        let blueTeeA = CourseTee(color: .blue, rating: 71.0, slope: 115, frontNine: frontNineA, backNine: backNineA)
        var aGC = GolfCourse(name: "Course A", address: "", phoneNumber: 123456789)
        aGC.tees.append(blueTeeA)
//        golfCourses.append(aGC)
        round = Round(blueTee, nines: [1,0])
    }

}
