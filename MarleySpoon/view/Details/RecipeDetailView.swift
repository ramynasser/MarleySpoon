//
//  RecipeDetailView.swift
//  MarleySpoon (iOS)
//
//  Created by Ramy Nasser on 07/09/2021.
//

import Combine
import SwiftUI

struct RecipeDetailView: View {
    @ObservedObject var viewModel: RecipeDetailViewModel

    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 0) {
                ImageView(url: viewModel.photoUrl,
                          maxWidth: UIScreen.main.bounds.width,
                          maxHeight: 350)

                Text(viewModel.title)
                    .fontWeight(Font.Weight.semibold)
                    .font(Font.system(size: 20))
                    .padding()

                Text(viewModel.description)
                    .fontWeight(Font.Weight.regular)
                    .font(Font.system(size: 15))
                    .padding()
            }

            VStack(alignment: .leading, spacing: 0) {
                Text("Created By: \(viewModel.chefName)")
                    .fontWeight(Font.Weight.light)
                    .font(Font.system(size: 14))
                    .padding(.leading)

                Text("Calories: \(viewModel.calories)")
                    .fontWeight(Font.Weight.light)
                    .font(Font.system(size: 14))
                    .padding([.leading, .top, .bottom])

                HStack(alignment: .lastTextBaseline, spacing: 0) {
                    Text("Tags: ")
                        .fontWeight(Font.Weight.regular)
                        .font(Font.system(size: 14))
                        .padding(.leading)

                    ForEach(viewModel.recipeTags, id: \.self) { tagName in
                        Text("\(tagName) ")
                            .fontWeight(Font.Weight.light)
                            .font(Font.system(size: 14))
                    }
                }
            }

            Spacer()
        }.navigationBarTitle(Text("Recipe Detail"), displayMode: .inline)
    }
}
