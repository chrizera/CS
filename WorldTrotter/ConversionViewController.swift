//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Christian Perrone on 04/10/16.
//  Copyright © 2016 Christian Perrone. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {
    
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
    
    func updateCelsiusLabel() {
        if let value = celsiusValue {
            celsiusLabel.text = "\(value)"
        }
        else {
            celsiusLabel.text = "???"
        }
    }
    
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField) {
        
        //celsiusLabel.text = textField.text
        
        if let text = textField.text , !text.isEmpty {
            celsiusLabel.text = textField.text
        }
        else {
            celsiusLabel.text = "???"
        }
        
    }
    @IBAction func dismissKeyboard(sender: AnyObject) {
        textField.resignFirstResponder()
    }
    
}
