//
//  ItensAgenda.swift
//  Agenda
//
//  Created by Christian Perrone on 03/10/16.
//  Copyright © 2016 Christian Perrone. All rights reserved.
//

import UIKit

class ItensAgenda {
    var imagem: UIImage?
    var nome: String
    var email: String
    var telefone: String
    
    init?(imagem: UIImage?, nome: String, email: String, telefone: String) {
        self.imagem = imagem
        self.nome = nome
        self.email = email
        self.telefone = telefone
    }
}
