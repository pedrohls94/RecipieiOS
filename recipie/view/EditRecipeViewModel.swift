//
//  EditRecipeViewModel.swift
//  recipie
//
//  Created by Pedro Lenzi on 07/03/22.
//

import SwiftUI
import Combine

class EditRecipeViewModel: ObservableObject, Identifiable {
    @Published var name: String = ""
    
    private var recipeController: RecipeController
    
    private var disposables = Set<AnyCancellable>()
    
    init(_ recipeController: RecipeController) {
        self.recipeController = recipeController
        
        $name.dropFirst(1).sink(receiveValue: save(name:)).store(in: &disposables)
    }
    
    func save(name: String) {
        recipeController.registerNewRecipe(recipe: Recipe(name: name))
    }
}
