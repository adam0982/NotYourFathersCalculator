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
    var okayToCompute = false
    var equalsJustPressed = false
    var isError = false
    
    var operandOne: Double = 0.0
    var operandTwo: Double = 0.0
    var currentOperation: String = ""
    var lastOperation: String = ""
    var model = CalculatorModel()
    var activeButton: String = ""
    private lazy var selectedButton: CalculatorButton? = CalculatorButton()
    private lazy var prevSelectedButton: CalculatorButton = CalculatorButton()
    
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
        printValuesForDebug("")
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
            
            hasOperatorBeenEntered = false
            isError = false
            
            if equalsJustPressed {
                resetValues(operandOne,operandTwo: 0.0, operationToSetToCurrent: currentOperation, firstOperandEntered: true)
            }
            if newInput != "0" || displayValue != 0 {
                calculatorDisplay.text! = newInput
                isNewValueInput = false

            }
        } else {
            if newInput != "." || !hasDecimalPointInput {
                if displayValue != 0.0{
                    calculatorDisplay.text! = calculatorDisplay.text! + newInput
                }
            }
        }
        if newInput == "." {
            hasDecimalPointInput = true
        }
    }
    
    @IBAction func inputOps(sender: UIButton) {
        
        if !isError{
            if let operation = sender.currentTitle {
                if !hasOperatorBeenEntered {

                    assignOperand()

                    if okayToCompute == true {
                        
                        hasFirstOperandBeenEntered = true
                        if operandTwo == 0 && currentOperation == "÷" {
                            sendErrorToDisplay()
                        }
                        equalsHelper()
                        
                    }
                    inputOpsHelper(operation)

                    equalsJustPressed = false
                }
            
                else{
                    currentOperation = operation
                    hasFirstOperandBeenEntered = true
                    isNewValueInput = true
                }
            }
        }
        printValuesForDebug(sender.currentTitle!)

    }
    
    func inputOpsHelper(operation:String) {
        print (operation)

        currentOperation = operation

        isOperationSelected = true
        hasFirstOperandBeenEntered = true

        isNewValueInput = true
        hasDecimalPointInput = false
        hasOperatorBeenEntered = true

    }
    
    func assignOperand(){
        if hasFirstOperandBeenEntered {
            operandTwo = displayValue
            okayToCompute = true
        } else{
            operandOne = displayValue
        }
    }
    
    @IBAction func executeEquals() {
        if !isError{
            assignOperand()
            if operandTwo == 0 && currentOperation == "÷" {
                sendErrorToDisplay()
            } else {
                equalsHelper()
                hasOperatorBeenEntered = true
                equalsJustPressed = true
                hasFirstOperandBeenEntered = false

            }
        }
        printValuesForDebug(currentOperation)
    }
    
    func equalsHelper(){
        displayValue = model.performOperation(operandOne, operandTwo: operandTwo, operation: currentOperation)
        operandOne = displayValue
        isOperationSelected = false
        isNewValueInput = true
        hasDecimalPointInput = false
        okayToCompute = true
    }
    
    func sendErrorToDisplay() {
        calculatorDisplay.text = "ERROR!"
        isError = true
        resetValues(0.0,operandTwo: 0.0, operationToSetToCurrent: "", firstOperandEntered: false)
    }
    
    @IBAction func clearAll() {
        displayValue = 0
        resetValues(0.0, operandTwo: 0.0, operationToSetToCurrent: "", firstOperandEntered: false)
    }
    
    func resetValues(operandOne:Double, operandTwo:Double, operationToSetToCurrent:String,firstOperandEntered:Bool) {
        isNewValueInput = true
        hasDecimalPointInput = false
        hasOperatorBeenEntered = false
        hasFirstOperandBeenEntered = firstOperandEntered
        isOperationSelected = false
        okayToCompute = false
        
        self.operandOne = operandOne
        self.operandTwo = operandTwo
        currentOperation = operationToSetToCurrent
        lastOperation = ""
        activeButton = ""
    }
    

    func printValuesForDebug(operation: String) {
        print("")
        print("isNewValueInput: \(isNewValueInput)")
        print("hasDecimalPointInput: \(hasDecimalPointInput)")
        print("operandOne: \(operandOne)")
        print("operandTwo: \(operandTwo)")
        print("hasFirstOperandBeenEntered: \(hasFirstOperandBeenEntered)")
        print("operation: \(operation)")
        print("currentOperation: \(currentOperation)")
        print("active button: \(activeButton)")
        //print("displayValue: \(displayValue)")
        print("hasOperatorBeenEntered: \(hasOperatorBeenEntered)")
        print("")
    }
    
    
}
