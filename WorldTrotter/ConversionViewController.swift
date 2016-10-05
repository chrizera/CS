//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Christian Perrone on 04/10/16.
//  Copyright © 2016 Christian Perrone. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    var fahrenheitValue: Double? {
        didSet {
            updateCelsiusLabel()
        }
    }
    var celsiusValue: Double? {
        if let value = fahrenheitValue {
            return (value - 32) * (5/9)
        }
        else {
            return nil
        }
    }
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
        
    }()
    
    func updateCelsiusLabel() {
        if let value = celsiusValue {
            //celsiusLabel.text = "\(value)"
            celsiusLabel.text = numberFormatter.string(for: value)
        }
        else {
            celsiusLabel.text = "???"
        }
    }
    
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField) {
        
        //celsiusLabel.text = textField.text
        /*
        if let text = textField.text , !text.isEmpty {
            celsiusLabel.text = textField.text
        }
        else {
            celsiusLabel.text = "???"
        }
        */
        
        if let text = textField.text , let value = Double(text) {
            fahrenheitValue = value
        }
        else {
            fahrenheitValue = nil
        }
    }
    @IBAction func dismissKeyboard(sender: AnyObject) {
        textField.resignFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeparator = string.range(of: ".")
        let letters = CharacterSet.letters
        let existingTextHasLetters = textField.text?.rangeOfCharacter(from: letters)
        let replacementTextHasLetters = string.rangeOfCharacter(from: letters)
        
        if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil && existingTextHasLetters == nil && replacementTextHasLetters == nil {
            return false
        }
        else {
            return true
        }
    }
    
}
