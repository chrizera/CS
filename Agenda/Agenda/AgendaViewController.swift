//
//  AgendaViewController.swift
//  Agenda
//
//  Created by Christian Perrone on 03/10/16.
//  Copyright © 2016 Christian Perrone. All rights reserved.
//

import UIKit

class AgendaViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var foto: UIImageView!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var telefone: UITextField!
    @IBOutlet weak var nome: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBAction func selectImageFromLibrary(_ sender: UITapGestureRecognizer) {
        email.resignFirstResponder()
        telefone.resignFirstResponder()
        nome.resignFirstResponder()
        
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        foto.image = selectedImage
        
        dismiss(animated: true, completion: nil)
    }
    
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

