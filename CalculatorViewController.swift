//
//  CalculatorViewController.swift
//  NotYourFathersCalculator
//
//  Created by Adam Serruys on 4/23/16.
//  Copyright © 2016 Adam Serruys. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var isNewValueInput: Bool = true
    var model = CalculatorModel()
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(calculatorDisplay.text!)!.doubleValue
        }
        set {
            calculatorDisplay.text = "\(newValue)"
            isNewValueInput = false
        }
    }

    @IBOutlet weak var calculatorDisplay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func inputValue(sender: UIButton) {
        
        let newInput = sender.currentTitle!
        
        if isNewValueInput {
            calculatorDisplay.text! = newInput
            isNewValueInput = false
        } else {
            calculatorDisplay.text! = calculatorDisplay.text! + newInput
        }
    }
 
    @IBAction func inputOps(sender: UIButton) {
        isNewValueInput = true
    }

}
