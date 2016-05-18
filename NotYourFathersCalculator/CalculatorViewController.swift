//
//  CalculatorViewController.swift
//  NotYourFathersCalculator
//
//  Created by Adam Serruys on 4/25/16.
//  Copyright © 2016 Adam Serruys. All rights reserved.
//


import UIKit

class CalculatorViewController: UIViewController {
    
    var isNewValueInput: Bool = true
    var hasDecimalPointInput: Bool = false
    var hasOperatorBeenEntered: Bool = false
    var hasFirstOperandBeenEntered: Bool = false
    var isOperationSelected: Bool = false
    
    var operandOne: Double = 0.0
    var operandTwo: Double = 0.0
    var currentOperation: String = ""
    var lastOperation: String = ""
    var model = CalculatorModel()
    var activeButton: String = ""
    
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
        
        activeButton = ""
        
        let newInput = sender.currentTitle!
        
        if isNewValueInput {
            if newInput != "0"{
                calculatorDisplay.text! = newInput
                isNewValueInput = false
            }
        } else {
            if newInput != "." || !hasDecimalPointInput {
                calculatorDisplay.text! = calculatorDisplay.text! + newInput
            }
        }
        if newInput == "." {
            hasDecimalPointInput = true
        }
    }
    
    @IBAction func inputOps(sender: UIButton) {
        
        
        if let operation = sender.currentTitle {
            if operation != activeButton && !isNewValueInput{
                if hasFirstOperandBeenEntered {
                    operandTwo = displayValue
                } else{
                    operandOne = displayValue
                }
                inputOpsHelper(operation)
            }
        }
        
        printValuesForDebug(sender.currentTitle!)

    }
    
    func inputOpsHelper(operation:String) {
        switch operation {
        case "C":
            operandOne = 0
            operandTwo = 0
            isOperationSelected = false
            hasFirstOperandBeenEntered = false
            displayValue = 0
        case "=":
            displayValue = model.performOperation(operandOne, operandTwo: operandTwo, operation: currentOperation)
            operandOne = displayValue
            isOperationSelected = false
            hasFirstOperandBeenEntered = false
        default:
            activeButton = operation
            if hasFirstOperandBeenEntered {
                inputOpsHelper("=")
            }
            lastOperation = currentOperation
            currentOperation = operation
            isOperationSelected = true
            hasFirstOperandBeenEntered = true
        }
        isNewValueInput = true
        hasDecimalPointInput = false
        hasOperatorBeenEntered = true
    }
    
    func printValuesForDebug(operation: String) {
        print("")
        print("isNewValueInput: \(isNewValueInput)")
        print("hasDecimalPointInput: \(hasDecimalPointInput)")
        print("operandOne: \(operandOne)")
        print("operandTwo: \(operandTwo)")
        print("hasFirstOperandBeenEntered: \(hasFirstOperandBeenEntered)")
        print("operation: \(operation)")
        print("displayValue: \(displayValue)")
        print("hasOperatorBeenEntered: \(hasOperatorBeenEntered)")
        print("")
    }
    
    
}
