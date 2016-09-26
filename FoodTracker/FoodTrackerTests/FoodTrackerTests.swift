//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Christian Perrone on 21/09/16.
//  Copyright © 2016 Christian Perrone. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
    //MARK: FoodTracker Tests
    
    // Teste para ver se o init retorna quando recebe um nome e uma avaliaçao positiva
    func testMealInitialization(){
        // Casos de sucesso
        let potentialItem = Meal(name: "Newest Meal", photo: nil, rating: 5)
        XCTAssertNotNil(potentialItem, "Criado")
        
        // Casos de falha
        let emptyName = Meal(name: "", photo: nil, rating: 0)
        XCTAssertNil(emptyName, "Nome nao pode ser vazio")
        
        let negativeRating = Meal(name: "One more meal", photo: nil, rating: -3)
        XCTAssertNil(negativeRating, "Avaliacao com valor negativo")
        
        
    }
}
