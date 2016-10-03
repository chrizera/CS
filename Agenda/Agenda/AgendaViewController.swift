//
//  AgendaViewController.swift
//  Agenda
//
//  Created by Christian Perrone on 03/10/16.
//  Copyright © 2016 Christian Perrone. All rights reserved.
//

import UIKit

class AgendaViewController: UIViewController{
    
    @IBOutlet weak var foto: UIImageView!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var telefone: UITextField!
    @IBOutlet weak var nome: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var itemAgenda: ItensAgenda?
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if saveButton === sender as AnyObject{
            let name = nome.text ?? ""
            let emailL = email.text ?? ""
            let tel = telefone.text ?? ""
            let photo = foto.image
            
            itemAgenda = ItensAgenda(imagem: photo, nome: name, email: emailL, telefone: tel)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

