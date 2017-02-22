//
//  DatePickerTableViewCell.swift
//  CellControlKit
//
//  Created by Wendell Antildes M Sampaio on 19/02/2017.
//  Copyright © 2017 Wendell Antildes. All rights reserved.
//

import UIKit

@IBDesignable
class DatePickerTableViewCell: BaseTableViewCell {
    
    var datePicker = UIDatePicker() {
        didSet{
            self.textField.inputView = datePicker
            self.setupDatePickerActions()
            self.setSelectedDateToTextField()
        }
    }
    
    private var textField  = UITextField()
    var textFieldDelegate : DatePickerTextFieldDelegate!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.textFieldDelegate = DatePickerTextFieldDelegate(self)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.textFieldDelegate = DatePickerTextFieldDelegate(self)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        guard let label = self.titleLabel else{
            return
        }
        let bounds = self.contentView.bounds
        self.textField.frame = CGRect(x:label.frame.size.width + self.leftMargin + self.distanceBetweenComponents, y: bounds.origin.y, width: bounds.size.width - label.frame.size.width - self.rightMargin - self.leftMargin - self.distanceBetweenComponents, height: bounds.size.height)
    }
    
    override func configureControls() {
        super.configureControls()
        let textField = UITextField()
        textField.autocapitalizationType = UITextAutocapitalizationType.none
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.textColor = UIColor.black
        textField.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        textField.clearButtonMode = UITextFieldViewMode.whileEditing
        textField.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        textField.textAlignment = .right
        textField.inputView = UIDatePicker()
        textField.delegate = textFieldDelegate
        self.contentView.addSubview(textField)
        self.textField = textField
        self.setupDatePickerActions()
        self.setSelectedDateToTextField()
    }
    
    func setupDatePickerActions(){
        self.datePicker.addTarget(self, action: #selector(DatePickerTableViewCell.setSelectedDateToTextField), for: .valueChanged)
    }
    
    func setSelectedDateToTextField(){
        switch self.datePicker.datePickerMode {
        case .countDownTimer:
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm"
            let date = dateFormatter.string(from: self.datePicker.date)
            self.textField.text = date
        case .date:
            self.textField.text = DateFormatter.localizedString(from: datePicker.date, dateStyle: .medium, timeStyle: .none)
        case .dateAndTime:
            self.textField.text = DateFormatter.localizedString(from: datePicker.date, dateStyle: .medium, timeStyle: .medium)
        case .time:
            self.textField.text = DateFormatter.localizedString(from: datePicker.date, dateStyle: .none, timeStyle: .short)
        }
    }
}
