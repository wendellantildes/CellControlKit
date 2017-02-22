//
//  EntryTableViewCell.swift
//  Forms
//
//  Created by Wendell Antildes M Sampaio on 12/02/2017.
//  Copyright © 2017 Wendell Antildes M Sampaio. All rights reserved.
//

import UIKit

@IBDesignable
class EntryTableViewCell: BaseTableViewCell {
    
    @IBInspectable var placeholder: String?
    var textField : UITextField?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        guard let label = self.titleLabel, let textField = self.textField else{
            return
        }
        let bounds = self.contentView.bounds
        textField.frame = CGRect(x:label.frame.size.width + self.leftMargin + self.distanceBetweenComponents, y: bounds.origin.y, width: bounds.size.width - label.frame.size.width - self.rightMargin - self.leftMargin - self.distanceBetweenComponents, height: bounds.size.height)
    }
    
    override func setupControls(){
        super.setupControls()
        let textField = UITextField()
        textField.autocapitalizationType = UITextAutocapitalizationType.none
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.textColor = UIColor.black
        textField.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        textField.clearButtonMode = UITextFieldViewMode.whileEditing
        textField.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        textField.textAlignment = .right
        textField.placeholder = self.placeholder
        self.contentView.addSubview(textField)
        self.textField = textField
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForInterfaceBuilder() {
        self.setupControls()
    }

}
