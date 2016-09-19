//
//  ViewController.swift
//  Calculator
//
//  Created by Christian Perrone on 16/09/16.
//  Copyright © 2016 Christian Perrone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var displayDigit: UILabel!
    
    private var isTypying = false
    
    private var displayValue: Double {
        get {
            return Double(displayDigit.text!)!
        }
        set {
            displayDigit.text = String(newValue)
        }
    }
    
    
    @IBAction private func touchDigits(sender: UIButton) {
        let digit = sender.currentTitle!
        
        if isTypying {
            let currentInDisplay = displayDigit.text!
            displayDigit.text = currentInDisplay + digit
        }
        else {
            displayDigit.text = digit
        }
        
        isTypying = true
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction private func performOperation(sender: UIButton) {
        if isTypying {
            brain.setOperand(displayValue)
            isTypying = false
        }
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        displayValue = brain.result
    }
}

