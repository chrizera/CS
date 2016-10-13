//
//  DetailViewController.swift
//  Homepwner
//
//  Created by Christian Perrone on 13/10/16.
//  Copyright © 2016 Christian Perrone. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var serialNumberField: UITextField!
    @IBOutlet var valueField: UITextField!
    @IBOutlet var dateLabel: UILabel!
    
    var item: Item!
    
    let numberFormatter: NumberFormatter = {
       
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        return formatter
    }()
    
    let dateFormatter: DateFormatter = {
       
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        return formatter
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameField.text = item.name
        serialNumberField.text = item.serialNumber
        //valueField.text = "\(item.valueInDollars)"
        valueField.text = numberFormatter.string(from: item.valueInDollars as NSNumber)
        //dateLabel.text = "\(item.dateCreated)"
        dateLabel.text = dateFormatter.string(from: item.dateCreated as Date)
    }
}