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
    @State private var isPresented = false
    @State private var newRecipeData = Recipe.Data()
    
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
            isPresented = true
        })
        {
            Image(systemName: "plus")
        })
        .sheet(isPresented: $isPresented)
        {
            NavigationView
            {
                EditRecipeView(recipeData: $newRecipeData)
                    .navigationBarItems(leading: Button("Cancel"){
                        isPresented = false
                    }, trailing: Button("Add") {
                        let newRecipe = Recipe(name: newRecipeData.name, steps: newRecipeData.steps, ingredients: newRecipeData.ingredients, color: newRecipeData.color)
                        recipes.append(newRecipe)
                        isPresented = false
                    })
            }
        }
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
