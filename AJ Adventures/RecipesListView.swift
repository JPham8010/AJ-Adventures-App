//
//  RecipesView.swift
//  AJ Adventures
//
//  Created by Jennifer Pham on 6/16/21.
//

import SwiftUI

struct RecipesListView: View
{
    @Binding var recipes: [Recipe]
    @State private var newRecipe = ""
    
    var body: some View
    {
        List
        {
            ForEach(recipes)
            { recipe in
                NavigationLink(destination: RecipeDetailView(recipe: binding(for: recipe)))
                {
                    RecipeCardView(recipe: recipe)
                        .listRowBackground(recipe.color)
                }
            }
        }
        .navigationTitle("Recipes")
        .navigationBarItems(trailing: Button(action: {
            withAnimation {
                //TODO: Add functionality to the plus button. When pressed, create a new recipe.
            }
        })
        {
            Image(systemName: "plus")
        })
    }
    
    private func binding(for recipe: Recipe) -> Binding<Recipe> {
        guard let recipeIndex = recipes.firstIndex(where: { $0.id == recipe.id}) else {
            fatalError("Can't find recipe in list")
        }
        
        return $recipes[recipeIndex]
    }
}

struct RecipesView_Previews: PreviewProvider
{
    static var previews: some View
    {
        NavigationView
        {
            RecipesListView(recipes: .constant(Recipe.data))
        }
    }
}
