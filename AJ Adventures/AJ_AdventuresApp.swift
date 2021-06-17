//
//  AJ_AdventuresApp.swift
//  AJ Adventures
//
//  Created by Jennifer Pham on 6/16/21.
//

import SwiftUI

@main
struct AJ_AdventuresApp: App
{
    @State private var recipes = Recipe.data
    var body: some Scene
    {
        WindowGroup
        {
            NavigationView
            {
                RecipesListView(recipes: $recipes)
            }
        }
    }
}
