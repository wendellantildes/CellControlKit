//
//  BaseTableViewCell.swift
//  CellControlKit
//
//  Created by Wendell Antildes M Sampaio on 15/02/2017.
//  Copyright © 2017 Wendell Antildes. All rights reserved.
//

import UIKit

@IBDesignable
class BaseTableViewCell: UITableViewCell {
    
    @IBInspectable var title : String?
    
    let leftMargin : CGFloat = 10
    let rightMargin : CGFloat = 10
    let distanceBetweenComponents : CGFloat = 10
    var titleLabel : UILabel?

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
        guard let label = self.titleLabel else{
            return
        }
        let bounds = self.contentView.bounds
        label.sizeToFit()
        label.center = self.centerToPositionCustomControls()
        label.frame.origin.x = bounds.origin.x + self.leftMargin
    }
    
    func configureControls(){
        let label = UILabel()
        label.text = self.title
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor.black
        self.contentView.addSubview(label)
        self.titleLabel = label
        self.selectionStyle = UITableViewCellSelectionStyle.none
    }

    func centerToPositionCustomControls() -> CGPoint{
        return self.superview!.convert(self.center, to: self)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForInterfaceBuilder() {
        self.configureControls()
    }
}
