//
//  DetailView.swift
//  AJ Adventures
//
//  Created by Jennifer Pham on 6/17/21.
//

import SwiftUI

struct DetailView: View
{
    let recipe: Recipe
    var body: some View
    {
        List
        {
            /*
                HStack
                {
                    Label("Color", systemImage: "paintpalette")
                    Spacer()
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(recipe.color)
                    
                }
                */
            
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
    }
}

struct DetailView_Previews: PreviewProvider
{
    static var previews: some View
    {
        NavigationView
        {
            DetailView(recipe: Recipe.data[0])
        }
    }
}
