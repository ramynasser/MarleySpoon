//
//  MarleySpoonApp.swift
//  Shared
//
//  Created by Ramy Nasser on 07/09/2021.
//

import SwiftUI

@main
struct MarleySpoonApp: App {
    var body: some Scene {
        WindowGroup {
            RecipeListView(viewModel: RecipeListViewModel())
        }
    }
}
