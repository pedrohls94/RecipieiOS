//
//  Recipe.swift
//  Recipie
//
//  Created by Pedro Lenzi on 01/11/20.
//  Copyright © 2020 Pedro Lenzi. All rights reserved.
//

import Foundation

class Recipe {
    private var managedObject: RecipeMO
    
    var name: String
    var ingredients: [Ingredient]
    
    init(_ recipeMO: RecipeMO) {
        managedObject = recipeMO
        
        name = recipeMO.name ?? UUID().uuidString
        
        ingredients = [Ingredient]()
        for ingredientMO in recipeMO.ingredients ?? NSSet() {
            ingredients.append(Ingredient(ingredientMO as! IngredientMO))
        }
    }
}
