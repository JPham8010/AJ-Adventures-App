//
//  RecipesView.swift
//  AJ Adventures
//
//  Created by Jennifer Pham on 6/16/21.
//

import SwiftUI

struct RecipesListView: View
{
    let recipes: [Recipe]
    
    var body: some View
    {
        List
        {
            ForEach(recipes)
            { recipe in
                NavigationLink(destination: RecipeDetailView(recipe: recipe))
                {
                    RecipeCardView(recipe: recipe)
                }
            }
        }
        .navigationTitle("Recipes")
        .navigationBarItems(trailing: Button(action: {})
        {
            Image(systemName: "plus")
        })
    }
}

struct RecipesView_Previews: PreviewProvider
{
    static var previews: some View
    {
        NavigationView
        {
            RecipesListView(recipes: Recipe.data)
        }
    }
}
