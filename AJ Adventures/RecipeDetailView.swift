//
//  DetailView.swift
//  AJ Adventures
//
//  Created by Jennifer Pham on 6/17/21.
//

import SwiftUI

struct RecipeDetailView: View
{
    //let recipe: Recipe
    @Binding var recipe: Recipe
    @State private var data: Recipe.Data = Recipe.Data()
    @State private var isPresented = false
    var body: some View
    {
        List
        {
            Section(header: Text("Ingredients"))
            {
                ForEach(recipe.ingredients, id: \.self)
                { ingredients in
                    Label(ingredients, systemImage: "checkmark.circle.fill")
                    
                }
            }
            Section(header: Text("Steps"))
            {
                ForEach(recipe.steps, id: \.self)
                { steps in
                    Label(steps, systemImage: "list.number")
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationBarItems(trailing: Button("Edit") {
            isPresented = true;
            data = recipe.data
        })
        .navigationTitle(recipe.name)
        .fullScreenCover(isPresented: $isPresented) {
            NavigationView{
                EditRecipeView(recipeData: $data)
                    .navigationTitle(recipe.name)
                    .navigationBarItems(leading: Button("Canel") {
                        isPresented = false
                    }, trailing: Button("Done") {
                        isPresented = false
                        recipe.update(from: data)
                    })
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider
{
    static var previews: some View
    {
        NavigationView
        {
            RecipeDetailView(recipe: .constant(Recipe.data[0]))
        }
    }
}
