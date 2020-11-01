//
//  Ingredient.swift
//  Recipie
//
//  Created by Pedro Lenzi on 01/11/20.
//  Copyright © 2020 Pedro Lenzi. All rights reserved.
//

import Foundation

class Ingredient {
    private var managedObject: IngredientMO
    
    var name: String
    
    init(_ ingredientMO: IngredientMO) {
        managedObject = ingredientMO
        
        name = ingredientMO.name ?? UUID().uuidString
    }
}
