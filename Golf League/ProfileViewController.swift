//
//  ProfileViewController.swift
//  Golf League
//
//  Created by Andrew Motika on 12/21/17.
//  Copyright © 2017 Andrew Motika. All rights reserved.
//

import UIKit


class ProfileViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    
    
    var golfer: Golfer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadDefaultGolfer()
        updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: Private methods
    private func updateUI() {
        guard let golfer = self.golfer else {
            fatalError("No golfer set")
        }
        nameLabel.text = "\(golfer.firstName) \(golfer.lastName)"
    }
    
    private func loadDefaultGolfer() {
        golfer = Golfer(firstName: "AJ", lastName: "Motika", emailAddress: "ajmotika@gmail.com", phoneNumber: nil)
    }

}

