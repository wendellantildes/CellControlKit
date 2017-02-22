//
//  CustomDatePicker.swift
//  CellControlKit
//
//  Created by Wendell Antildes M Sampaio on 21/02/2017.
//  Copyright © 2017 Wendell Antildes. All rights reserved.
//

import UIKit

class DatePickerTextFieldDelegate: NSObject, UITextFieldDelegate {

    let cell : DatePickerTableViewCell!
    
    init(_ cell : DatePickerTableViewCell) {
        self.cell = cell
    }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let toolbar = UIToolbar()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: textField, action: #selector(UITextField.resignFirstResponder))
        toolbar.items = [doneButton]
        toolbar.sizeToFit()
        textField.inputAccessoryView = toolbar
        return true
    }

}
