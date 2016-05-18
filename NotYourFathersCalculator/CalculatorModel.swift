//
//  CalculatorModel.swift
//  NotYourFathersCalculator
//
//  Created by Adam Serruys on 4/25/16.
//  Copyright © 2016 Adam Serruys. All rights reserved.
//

import Foundation

class CalculatorModel {
    
    
    init(){}
    
    func performOperation(operandOne:Double, operandTwo:Double, operation:String) -> Double {
        
        switch operation {
        case "+":
            print("add function called")
            return add(operandOne, operandTwo: operandTwo)
        case "−":
            print("subtract function called")
            return subtract(operandOne, operandTwo: operandTwo)
        case "×":
            print("multiply function called")
            return multiply(operandOne, operandTwo: operandTwo)
        case "÷":
            print("division function called")
            return division(operandOne, operandTwo: operandTwo)
        default:
            print("default called")
            return equals(operandTwo)
        }
        
    }
    
    private func add(operandOne:Double, operandTwo:Double) -> Double {
        return operandOne + operandTwo
    }
    
    private func subtract(operandOne:Double, operandTwo:Double) -> Double {
        return operandOne - operandTwo
    }
    
    private func multiply(operandOne:Double, operandTwo:Double) -> Double {
        return operandOne * operandTwo
    }
    
    private func division(operandOne:Double, operandTwo:Double) -> Double {
        return operandOne / operandTwo
    }
    
    private func equals(operandOne:Double) -> Double {
        return operandOne
    }
    
}