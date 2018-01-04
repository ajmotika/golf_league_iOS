//
//  CourseTeePickerView.swift
//  GolfLeague
//
//  Created by Andrew Motika on 12/31/17.
//  Copyright © 2017 Andrew Motika. All rights reserved.
//

import UIKit

protocol CourseTeePickerViewDelegate: class {
    func teeSelected(_ courseTee: CourseTee)
}

class CourseTeePickerView: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //MARK: Properties
    var golfCourse: GolfCourse? {
        didSet {
            self.reloadAllComponents()
        }
    }
    weak var courseTeeDelegate: CourseTeePickerViewDelegate?
    
    //MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
        self.dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.delegate = self
        self.dataSource = self
    }
    
    //MARK: UIPickerViewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard let gc = self.golfCourse else {
            return 0
        }
        return gc.tees.count
    }
    
    //MARK: UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard let gc = self.golfCourse else {
            return nil
        }
        return gc.tees[row].color.name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard let courseTee = self.golfCourse?.tees[row] else {
            print("unable to find course tee")
            return
        }
        courseTeeDelegate?.teeSelected(courseTee)
    }
}
