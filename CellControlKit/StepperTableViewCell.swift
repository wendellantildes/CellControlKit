//
//  StepperTableViewCell.swift
//  Forms
//
//  Created by Wendell Antildes M Sampaio on 12/02/2017.
//  Copyright © 2017 Wendell Antildes M Sampaio. All rights reserved.
//

import UIKit

@IBDesignable
class StepperTableViewCell: UITableViewCell {

    @IBInspectable var title : String?
    @IBInspectable var value : Double = 0
    @IBInspectable var maximumValue : Double = 0
    @IBInspectable var minimumValue : Double = 0
    
    let leftMargin : CGFloat = 10
    let rightMargin : CGFloat = 10
    
    var stepperLabel : UILabel?
    private var stepperValueLabel : UILabel?
    var stepper : UIStepper?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureControls()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configureControls()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.sizeToFitCustomControls()
    }
    
    func sizeToFitCustomControls(){
        guard let label = self.stepperLabel, let stepperValueLabel = self.stepperValueLabel, let stepper = self.stepper else{
            return
        }
        let bounds = self.contentView.bounds
        let center = self.superview!.convert(self.center, to: self)
        label.sizeToFit()
        label.center = center
        label.frame.origin.x = bounds.origin.x + self.leftMargin
        stepperValueLabel.sizeToFit()
        stepperValueLabel.center = center
        stepper.sizeToFit()
        stepper.center = center
        stepper.frame.origin.x = bounds.size.width - stepper.frame.size.width - self.rightMargin
        
    }
    
     func configureControls(){
        let label = UILabel()
        label.text = self.title
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        let stepperValue = UILabel()
        stepperValueLabel?.text = ""
        stepperValue.textColor = UIColor.black
        stepperValue.font = UIFont.boldSystemFont(ofSize: 16)
        let stepper = UIStepper()
        stepper.maximumValue = self.maximumValue
        stepper.minimumValue = self.minimumValue
        stepper.value = self.value
        stepper.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        stepper.addTarget(self, action: #selector(StepperTableViewCell.stepperValueChanged(stepper:)), for: .valueChanged)
        self.contentView.addSubview(label)
        self.contentView.addSubview(stepperValue)
        self.contentView.addSubview(stepper)

        self.stepperLabel = label
        self.stepperValueLabel = stepperValue
        self.stepper = stepper
        self.selectionStyle = UITableViewCellSelectionStyle.none
        self.setStepperValueLabel()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForInterfaceBuilder() {
        self.configureControls()
    }
    
    func stepperValueChanged(stepper : UIStepper){
        self.setStepperValueLabel()
    }
    
    private func setStepperValueLabel(){
        guard let label = self.stepperValueLabel, let stepper = self.stepper else{
            return
        }
        label.text = "\(Int(stepper.value))"
        label.sizeToFit()
    }

}
