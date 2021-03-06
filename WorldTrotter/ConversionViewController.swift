//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Christian Perrone on 04/10/16.
//  Copyright © 2016 Christian Perrone. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ConversionViewController loaded its view")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let date = NSDate()
        let calendar = NSCalendar.current
        let hour = calendar.component(.hour, from: date as Date)
        
        if hour > 18 {
            view.backgroundColor = UIColor.black
        }
        else {
            view.backgroundColor = UIColor.cyan
        }
    }
    
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
        
        /*if let text = textField.text , let value = Double(text) {
            fahrenheitValue = value
        }
        else {
            fahrenheitValue = nil
        }*/
        
        if let text = textField.text, let number = numberFormatter.number(from: text) {
            fahrenheitValue = number.doubleValue
        }
        else {
            fahrenheitValue = nil
        }
    }
    @IBAction func dismissKeyboard(sender: AnyObject) {
        textField.resignFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        /*let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeparator = string.range(of: ".")*/
        
        let currentLocale = NSLocale.current
        let decimalSeparator = currentLocale.decimalSeparator!
        
        let existingTextHasDecimalSeparator = textField.text?.range(of: decimalSeparator)
        let replacementTextHasDecimalSeparator = string.range(of: decimalSeparator)
        
        let letters = CharacterSet.letters
        let replacementTextHasLetters = string.rangeOfCharacter(from: letters)
        
        if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil {
            return false
        }
        else if replacementTextHasLetters != nil {
            return false
        }
        else {
            return true
        }
    }
    
}
