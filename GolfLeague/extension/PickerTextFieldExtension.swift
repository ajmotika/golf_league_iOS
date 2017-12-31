//
//  PickerTextFieldExtension.swift
//  Golf League
//
//  Created by Andrew Motika on 12/30/17.
//  Copyright © 2017 Andrew Motika. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    func loadDropdownData(data: [String]) {
        self.inputView = MyPickerView(pickerData: data, dropdownField: self)
    }
}
