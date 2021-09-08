//
//  RecipeServiceStub.swift
//  MarleySpoon
//
//  Created by Ramy Nasser on 08/09/2021.
//

import Foundation
import RxSwift
import RxCocoa

public class RecipeServiceStub: RecipeServiceProtocol {
    public var result = BehaviorRelay<Result<[Recipe],Error>>(value: .success([]))
    var fetchRecipeCallCount = 0
    var stubbedRecipes: [Recipe] = []
    var stubbedErrorString = ""
    
    init(recipes: [Recipe]) {
        result.accept(.success(recipes))
        stubbedRecipes = recipes
    }
    
    init(errorMessage: String) {
        let error = MockError.dummyError(message: errorMessage)
        result.accept(.failure(error))
        stubbedErrorString = errorMessage
    }
    
    public func fetchRecipes() {
      fetchRecipeCallCount += 1
    }
    
}

enum MockError: Error, LocalizedError {
  case dummyError(message: String)

  public var errorDescription: String? {
    switch self {
    case .dummyError(let message):
      return message
    }
  }
}
