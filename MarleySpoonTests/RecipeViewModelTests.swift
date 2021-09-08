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
        serviceStub = RecipeServiceStub()
        recipesViewModel = RecipeListViewModel(service: serviceStub)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_fetchRecipes_success_response() {
      let tag1 = Tag(name: "fatfree")
      let chef1 = Chef(name: "Steve Cook")
      let recipe1 = Recipe(title: "Awesome Recipe",
                           description: "Awesome Recipe's Description",
                           calories:789,
                           chef: chef1,
                           tags: [tag1])

      let tag2 = Tag(name: "fruit")
      let chef2 = Chef(name: "Tim Apple")
      let recipe2 = Recipe(title: "Mediocre Recipe",
                           description: "Mediocre Recipe's Description",
                           calories:666,
                           chef: chef2,
                           tags: [tag1, tag2])

      let tag3 = Tag(name: "meat")
      let chef3 = Chef(name: "The Mountain")
      let recipe3 = Recipe(title: "Beefy Recipe",
                           description: "Beefy Recipe's Description",
                           calories:568,
                           chef: chef3,
                           tags: [tag1, tag3])

      serviceStub.stubbedRecipes = [recipe1,recipe2,recipe3]
      recipesViewModel = RecipeListViewModel(service: serviceStub)
      recipesViewModel.fetchRecipes()
      XCTAssertEqual(serviceStub.fetchRecipeCallCount, 1)
      XCTAssertEqual(serviceStub.stubbedRecipes.count, recipesViewModel.recipes.count)
    }


    func test_fetchRecipes_failure_response() {
      let expectedMessage = "Some example error message"
      serviceStub.stubbedErrorString = expectedMessage
      recipesViewModel.fetchRecipes()
      XCTAssertEqual(serviceStub.fetchRecipeCallCount, 1)
      XCTAssertEqual(expectedMessage, recipesViewModel.error)
    }
}
