//
//  EditRecipeView.swift
//  AJ Adventures
//
//  Created by Jennifer Pham on 6/17/21.
//

import SwiftUI

struct EditRecipeView: View
{
    @State private var recipeData: Recipe.Data = Recipe.Data()
    @State private var newStep = ""
    
    var body: some View
    {
        List
        {
            Section(header: Text("Meeting Info"))
            {
                TextField("Name", text: $recipeData.name)
                HStack
                {
                    Text("\(Int(recipeData.steps.count)) steps")
                }
            }
            
            Section(header: Text("Attendees"))
            {
                ForEach(recipeData.steps, id: \.self)
                { steps in
                    Text(steps)
                }
                .onDelete
                { indices in
                    recipeData.steps.remove(atOffsets: indices)
                }
                
                HStack
                {
                    TextField("New Step", text: $newStep)
                    Button(action: {
                        withAnimation {
                            recipeData.steps.append(newStep)
                            newStep = ""
                        }
                    })
                    {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(newStep.isEmpty)
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct EditRecipeView_Previews: PreviewProvider
{
    static var previews: some View
    {
        EditRecipeView()
    }
}
