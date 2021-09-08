//
//  RecipeListView.swift
//  MarleySpoon (iOS)
//
//  Created by Ramy Nasser on 07/09/2021.
//

import SwiftUI

struct RecipeListView: View {
    @ObservedObject var viewModel: RecipeListViewModel

    var body: some View {
        NavigationView {
            List(viewModel.recipes) { recipe in
                ZStack {
                    RecipeRow(recipe: recipe)
                    NavigationLink(destination: RecipeDetailView(viewModel: RecipeDetailViewModel(recipe: recipe))) {
                        EmptyView()
                    }.buttonStyle(PlainButtonStyle())
                }.navigationBarTitle("Recipes")
            }
        }.onAppear {
            self.viewModel.fetchRecipes()
        }
    }
}
