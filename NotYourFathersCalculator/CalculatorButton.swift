//
//  CalculatorButton.swift
//  NotYourFathersCalculator
//
//  Created by Adam Serruys on 4/24/16.
//  Copyright © 2016 Adam Serruys. All rights reserved.
//

import UIKit

@IBDesignable
class CalculatorButton: UIButton {
    
    private var isSel: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.borderWidth = 1
        layer.borderColor = UIColor.blackColor().CGColor
        setSelectedValues(false)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        borderWidth = 1
        borderColor = UIColor.blackColor()
        setSelectedValues(false)
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
    
    func setSelectedValues(boolVal:Bool){
        if boolVal {
            borderWidth = 2
            borderColor = UIColor.redColor()
        }
        else {
            borderWidth = 1
            borderColor = UIColor.blueColor()
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
