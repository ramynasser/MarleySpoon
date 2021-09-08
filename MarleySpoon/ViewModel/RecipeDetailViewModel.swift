//
//  RecipeDetailViewModel.swift
//  MarleySpoon (iOS)
//
//  Created by Ramy Nasser on 08/09/2021.
//

import Foundation
public class RecipeDetailViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var calories: Int = 0
    @Published var chefName: String = ""
    @Published var photoUrl: String = ""
    @Published var recipeTags = [String]()

    public init(recipe: Recipe) {
        guard let title = recipe.title,
            let description = recipe.description,
            let calories = recipe.calories else {
            return
        }

        self.title = title
        self.description = description
        self.calories = calories

        recipeTags = recipe.tags?.map({ (tag) -> String in
            tag.name ?? ""
        }) ?? []

        chefName = recipe.chef?.name ?? ""

        guard let photoUrl = recipe.photo?.urlString else {
            return
        }
        self.photoUrl = photoUrl
    }
}
