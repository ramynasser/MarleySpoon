//
//  RecipeRow.swift
//  MarleySpoon (iOS)
//
//  Created by Ramy Nasser on 07/09/2021.
//

import SwiftUI

struct RecipeRow: View {
    let recipe: Recipe

    init(recipe: Recipe) {
        self.recipe = recipe
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ImageView(url: recipe.photo?.urlString,
                      maxWidth: UIScreen.main.bounds.width - 40,
                      maxHeight: 300)
            Text("\(recipe.title ?? "No name")")
                .fontWeight(Font.Weight.medium)
                .font(Font.system(size: 20))
                .padding()
        }
        .background(Color(.white))
    }
}
