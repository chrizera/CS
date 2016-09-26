//
//  Meal.swift
//  FoodTracker
//
//  Created by Christian Perrone on 26/09/16.
//  Copyright © 2016 Christian Perrone. All rights reserved.
//

import UIKit

class Meal {
    
    // MARK: Properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
    //Inicializa as propriedades
    init?(name: String,photo: UIImage?, rating: Int) {
        self.name = name
        self.photo = photo
        self.rating = rating
        
        //Condiçao para indicar que a inicializacao falhou
        if (name.isEmpty || rating < 0){
            return nil
        }
    }
    
    
}
