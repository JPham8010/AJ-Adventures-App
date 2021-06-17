//
//  CardView.swift
//  AJ Adventures
//
//  Created by Jennifer Pham on 6/16/21.
//

import SwiftUI

struct CardView: View
{
    let recipe: Recipe
    var body: some View
    {
        VStack(alignment: .leading)
        {
            Text(recipe.name)
                .font(.headline)
            
            Spacer()
            
            HStack
            {
                Label("\(recipe.steps.count) steps", systemImage: "list.bullet")
                    .accessibilityElement(children: /*@START_MENU_TOKEN@*/.ignore/*@END_MENU_TOKEN@*/)
                    .accessibilityLabel(Text("Steps"))
                    .accessibilityValue(Text("\(recipe.steps.count)"))
                Spacer()
                Label("\(recipe.ingredients.count) ingredients", systemImage: "list.bullet")
                    .accessibilityElement(children: /*@START_MENU_TOKEN@*/.ignore/*@END_MENU_TOKEN@*/)
                    .accessibilityLabel(Text("Ingredients"))
                    .accessibilityValue(Text("\(recipe.ingredients.count)"))
                    .padding(.trailing, 20)
            }
            .font(.caption)
        }
        .padding()
        //TODO: figure out why this isn't working v
        //.foregroundColor(recipe.color.accessibleFontColor)
    }
}

struct CardView_Previews: PreviewProvider
{
    static var recipe = Recipe.data[0]
    static var previews: some View
    {
        CardView(recipe: recipe)
            .background(recipe.color)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}