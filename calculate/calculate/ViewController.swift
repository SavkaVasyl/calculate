//
//  ViewController.swift
//  Calculator
//
//  Created by Admin on 14.08.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var displayResultlabel: UILabel!
    var stillTyping = false
    var firstOperand = 0.0
    var secondOperand = 0.0
    var operationSingn : String = ""
    var dotIsPlace = false
    
    
    var currentInput : Double {
        get{
            return Double(displayResultlabel.text!)!
        }
        
        set{
            let value = "\(newValue)"
            let valueArray = value.components(separatedBy: ".")
            if valueArray[1] == "0" {
                displayResultlabel.text = "\(valueArray[0])"
            }else {
                displayResultlabel.text = "\(newValue)"
            }
            
            stillTyping = false
        }
    }

    
    @IBAction func numberPressed(_ sender: UIButton) {
        
        let number = sender.currentTitle!
        
        if stillTyping {
            if (displayResultlabel.text?.characters.count)! < 20 {
                displayResultlabel.text = displayResultlabel.text!+number
            }
        } else {
            displayResultlabel.text = number
            stillTyping = true
        }
    }
    
    @IBAction func twoOperandPressed(_ sender: UIButton) {
        
        operationSingn = sender.currentTitle!
        firstOperand = currentInput
        stillTyping = false
        dotIsPlace = false
    }
    
    func operateWithTwoOperants (operation: (Double,Double) -> Double){
        
        currentInput = operation (firstOperand, secondOperand)
        stillTyping = false
    }

    @IBAction func equlityPressed(_ sender: UIButton) {
        
        if stillTyping {
            secondOperand = currentInput
        }
        
        dotIsPlace = false
        
        
        switch operationSingn {
        case "+":            operateWithTwoOperants{$0+$1}
        case "-":            operateWithTwoOperants{$0-$1}
        case "✕":            operateWithTwoOperants{$0*$1}
        case "÷":            operateWithTwoOperants{$0/$1}
        default:break
        }
    }

    @IBAction func clearButton(_ sender: UIButton) {
        
        
        firstOperand = 0
        secondOperand = 0
        currentInput = 0
        displayResultlabel.text = "0"
        stillTyping = false
        operationSingn = ""
        dotIsPlace = false
    }
    
    @IBAction func plusMinesButton(_ sender: UIButton) {
        
         currentInput = -currentInput
    }
    
    @IBAction func persentButton(_ sender: UIButton) {
        
        if firstOperand == 0 {
            currentInput = currentInput/100
        }else{
            secondOperand = firstOperand * currentInput/100
        }
    }

    @IBAction func squareButton(_ sender: UIButton) {
        
        currentInput = sqrt (currentInput)
    }
    
    @IBAction func dotButton(_ sender: UIButton) {
        
        if stillTyping && !dotIsPlace{
            displayResultlabel.text = displayResultlabel.text! + "."
            dotIsPlace = true
        } else if !stillTyping && !dotIsPlace {
            displayResultlabel.text = "0."
        }
    }
    
    @IBAction func sinButton(_ sender: UIButton) {
        
        currentInput = sin (currentInput)
    }
    
    @IBAction func cosButton(_ sender: UIButton) {
        
        currentInput = cos (currentInput)
    }
    
    @IBAction func tanButton(_ sender: UIButton) {
        
        currentInput = tan (currentInput)
    }
    @IBAction func constPiButton(_ sender: UIButton) {
        
        currentInput = (M_PI)
    }
    
    @IBAction func constEButton(_ sender: UIButton) {
        
        currentInput = (M_E)
    }
}
