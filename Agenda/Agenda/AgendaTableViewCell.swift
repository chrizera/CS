//
//  AgendaTableViewCell.swift
//  Agenda
//
//  Created by Christian Perrone on 03/10/16.
//  Copyright © 2016 Christian Perrone. All rights reserved.
//

import UIKit

class AgendaTableViewCell: UITableViewCell {

    @IBOutlet weak var imagem: UIImageView!
    @IBOutlet weak var nome: UILabel!
    @IBOutlet weak var telefone: UILabel!
    @IBAction func alterar(_ sender: UIButton) {
    }
    @IBAction func excluir(_ sender: UIButton) {
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
