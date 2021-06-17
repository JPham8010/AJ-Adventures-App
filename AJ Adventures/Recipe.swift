//
//  Recipe.swift
//  AJ Adventures
//
//  Created by Jennifer Pham on 6/16/21.
//

import SwiftUI

struct Recipe: Identifiable
{
    let id: UUID
    var name: String
    var steps: [String]
    var ingredients: [String]
    var color: Color
    
    init(id: UUID = UUID(), name: String, steps: [String], ingredients: [String], color: Color)
    {
        self.id = id
        self.name = name
        self.steps = steps
        self.ingredients = ingredients
        self.color = color
    }
}

extension Recipe
{
    static var data: [Recipe]
    {
        [
            Recipe(name: "Dish 1", steps: ["Step 1", "Step 2", "Step 3"], ingredients: ["Ingr 1", "Ingr 2", "Ingr 3"], color: Color("Dish 1")),
            Recipe(name: "Dish 2", steps: ["Step 1", "Step 2", "Step 3"], ingredients: ["Ingr 1", "Ingr 2", "Ingr 3"], color: Color("Dish 2")),
            Recipe(name: "Dish 3", steps: ["Step 1", "Step 2", "Step 3"], ingredients: ["Ingr 1", "Ingr 2", "Ingr 3"], color: Color("Dish 3")),
        ]
    }
}

extension Recipe
{
    struct Data
    {
        var name: String = ""
        var steps: [String] = []
        var ingredients: [String] = []
        var color: Color = .blue
    }
    
    var data: Data
    {
        return Data(name: name, steps: steps, ingredients: ingredients, color: color)
    }
    
    mutating func update(from data: Data)
    {
        name = data.name
        steps = data.steps
        ingredients = data.ingredients
        color = data.color
    }
}

