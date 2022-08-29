//
//  RecipeListView.swift
//  recipie
//
//  Created by Pedro Lenzi on 20/08/22.
//

import Foundation

import SwiftUI

struct RecipeListView: View {
    @ObservedObject var viewModel: RecipeListViewModel

    init(_ viewModel: RecipeListViewModel) {
        self.viewModel = viewModel
    }
    
    var editRecipeView = EditRecipeView(EditRecipeViewModel(RecipeControllerImpl()))
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.viewModel.recipeList) { recipe in
                    HStack {
                        Image("pie")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 70, height: 70)
                            .clipped()
                        Text(recipe.name)
                    }
                }
            }
            .listStyle(.plain)
            .toolbar {
                ToolbarItem {
                    NavigationLink(destination: editRecipeView) {
                        Label("Add recipe", systemImage: "plus")
                    }
                }
            }
            .navigationTitle("Recipie")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

//struct RecipeListView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecipeListView()
//    }
//}