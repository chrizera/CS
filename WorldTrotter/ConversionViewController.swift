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
    
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField) {
        
        //celsiusLabel.text = textField.text
        
        if let text = textField.text , !text.isEmpty {
            celsiusLabel.text = textField.text
        }
        else {
            celsiusLabel.text = "???"
        }
        
    }
    
}
