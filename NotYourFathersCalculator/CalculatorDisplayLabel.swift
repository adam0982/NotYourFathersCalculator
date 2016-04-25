//
//  CalculatorDisplayLabel.swift
//  NotYourFathersCalculator
//
//  Created by Adam Serruys on 4/24/16.
//  Copyright © 2016 Adam Serruys. All rights reserved.
//

import UIKit

class CalculatorDisplayLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.borderWidth = 1
        layer.borderColor = UIColor.blackColor().CGColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        borderWidth = 1
        borderColor = UIColor.blackColor()
    }
    
    @IBInspectable var borderWidth:CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.CGColor
        }
    }
    

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
