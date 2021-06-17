//
//  RecipesView.swift
//  AJ Adventures
//
//  Created by Jennifer Pham on 6/16/21.
//

import SwiftUI

struct RecipesView: View
{
    let recipes: [Recipe]
    
    var body: some View
    {
        List
        {
            ForEach(recipes)
            { recipe in
                NavigationLink(destination: Text (recipe.name))
                {
                    CardView(recipe: recipe)
                        .listRowBackground(recipe.color)
                }
                .listRowBackground(recipe.color)
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
            RecipesView(recipes: Recipe.data)
        }
    }
}
