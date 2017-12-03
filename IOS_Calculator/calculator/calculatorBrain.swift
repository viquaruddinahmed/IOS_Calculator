//
//  calculatorBrain.swift
//  calculator
//
//  Created by Guest User on 24/11/17.
//  Copyright © 2017 viquar. All rights reserved.
//

import Foundation
func sum(op1: Double, op2: Double) -> Double{
    return op1 + op2
}

func substract(op1: Double, op2: Double) -> Double{
    return op1 - op2
}

func multiply(op1: Double, op2: Double) -> Double{
    return op1 * op2
}

func divide(op1: Double, op2: Double) -> Double{
    return op1 / op2
}


struct Brain{
    

    
    private var accumulator: Double?
    
    private enum Operation{
        case binaryOperations((Double, Double)->Double)
        case equals
    }
    
    
    private var operations: Dictionary<String, Operation> =
    [
        "+" : Operation.binaryOperations(sum),
        "-" : Operation.binaryOperations(substract),
        "*" : Operation.binaryOperations(multiply),
        "/" : Operation.binaryOperations(divide),
        "=" : Operation.equals
       
    ]
    
    mutating func setOperaned(_ operand: Double){
        accumulator = operand
    }
    
    var result: Double?{
        get{
            return accumulator
        }
    }
    
    
    mutating func performOperation(_ symbol: String){
        if let operation = operations[symbol]{
            switch operation{
            case .binaryOperations(let function):
                performPendingBinaryOperation()
                if accumulator != nil{
                    pendingBinaryOperation = PendingBinaryOperations(function: function, firstOperand: accumulator!)
                }
            case .equals:
                performPendingBinaryOperation()
                break
            }
        }
    }
    
    private var pendingBinaryOperation: PendingBinaryOperations?
    
    mutating private func performPendingBinaryOperation(){
        if pendingBinaryOperation != nil && accumulator != nil{
            accumulator = pendingBinaryOperation!.perfom(with: accumulator!)
            pendingBinaryOperation = nil
        }
    
    }
    
    private struct PendingBinaryOperations{
        let function: (Double, Double) -> Double
        let firstOperand: Double
        
        func perfom(with secondOperand: Double) -> Double {
            
            return function(firstOperand, secondOperand)
        }
    }
}
