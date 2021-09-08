//
//  RecipeDetailViewModelTests.swift
//  MarleySpoonTests
//
//  Created by Ramy Nasser on 09/09/2021.
//

@testable import MarleySpoon
import XCTest

class RecipeDetailViewModelTests: XCTestCase {
    var recipeDetailViewModel: RecipeDetailViewModel!
    override func setUpWithError() throws {
        let tag1 = Tag(name: "tagName1")
        let tag2 = Tag(name: "tagName2")
        let tag3 = Tag(name: "tagName3")

        let chef = Chef(name: "Ramy")
        let recipe = Recipe(title: "title",
                            description: "description",
                            calories: 123,
                            chef: chef,
                            tags: [tag1, tag2, tag3])

        recipeDetailViewModel = RecipeDetailViewModel(recipe: recipe)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_recipeDetailViewModel_binding() {
        XCTAssertEqual(recipeDetailViewModel.chefName, "Ramy")
        XCTAssertEqual(recipeDetailViewModel.recipeTags.count, 3)
        XCTAssertEqual(recipeDetailViewModel.recipeTags, ["tagName1", "tagName2", "tagName3"])
        XCTAssertEqual(recipeDetailViewModel.title, "title")
        XCTAssertEqual(recipeDetailViewModel.description, "description")
    }
}
