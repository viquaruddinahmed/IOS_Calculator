//
//  ViewController.swift
//  calculator
//
//  Created by Guest User on 06/11/17.
//  Copyright © 2017 viquar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet var display: UILabel!// in var place we can use 'let' and display.. and : it teslls me where   amd there is is ! is becuse we know the label           exits ..since we know that it exits..
    var isTyping = false
    
    var displayValue: Double{
        get {
            return Double(display.text!)!
         
        }
        set{
            display.text = String(newValue)
        }
    }
    
    //var brain: Brain = Brain()
    
    @IBAction func digitTouch(_ sender: UIButton) { // IBaction what ever the  conected
                                                    //the aurg  are commposed of two words  it means when we pass a veriable it will take it
                                                    //sender: 
                                                    //UIbutton:
                                                    // proffessor Juan uzcategui
        let digit = sender.currentTitle!
        if isTyping{
            let textInDisplay = display.text!
            display.text = textInDisplay + digit
        }
        else{
            display.text = digit
            isTyping = true
        }
    }
    
    private var brain: Brain = Brain()
    
    @IBAction func performOperation(_ sender: UIButton) {
        if isTyping {
            brain.setOperaned(displayValue)
            isTyping = false
            
        }
        if let symbol = sender.currentTitle{
            brain.performOperation(symbol)
        }
        if let result = brain.result{
            displayValue=result
        }
    }
    
}

    



