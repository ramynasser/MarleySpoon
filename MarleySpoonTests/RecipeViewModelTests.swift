//
//  RecipeViewModelTests.swift
//  Tests iOS
//
//  Created by Ramy Nasser on 08/09/2021.
//

import XCTest
@testable import MarleySpoon
class RecipeViewModelTests: XCTestCase {
    var recipesViewModel: RecipeListViewModel!
    var serviceStub: RecipeServiceStub!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_fetchRecipes_success_response() {
      let tag = Tag(name: "tag1")
      let chef = Chef(name: "chef1")
      let recipe = Recipe(title: "title",
                           description: "description",
                           calories:123,
                           chef: chef,
                           tags: [tag])

      serviceStub = RecipeServiceStub(recipes: [recipe,recipe,recipe])
      recipesViewModel = RecipeListViewModel(service: serviceStub)
      recipesViewModel.fetchRecipes()
      XCTAssertEqual(serviceStub.fetchRecipeCallCount, 1)
      XCTAssertEqual(serviceStub.stubbedRecipes.count, recipesViewModel.recipes.count)
      XCTAssertEqual(recipesViewModel.recipes.count, 3)
      XCTAssertEqual(recipesViewModel.error, "")
    }


    func test_fetchRecipes_failure_response() {
      let expectedMessage = "Some example error message"
      serviceStub = RecipeServiceStub(errorMessage: expectedMessage)
      recipesViewModel = RecipeListViewModel(service: serviceStub)
      recipesViewModel.fetchRecipes()
      XCTAssertEqual(serviceStub.fetchRecipeCallCount, 1)
      XCTAssertEqual(expectedMessage, recipesViewModel.error)
      XCTAssertEqual(recipesViewModel.recipes.count, 0)
    }
}
