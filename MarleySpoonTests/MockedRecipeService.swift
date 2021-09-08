//
//  MockedRecipeService.swift
//  Tests iOS
//
//  Created by Ramy Nasser on 08/09/2021.
//

import Foundation
import RxSwift
import RxCocoa
@testable import MarleySpoon
class RecipeServiceStub: RecipeServiceProtocol {
    var result: BehaviorRelay<Result<[Recipe], Error>>
    
    var result: BehaviorRelay<Result<[Recipe], Error>>

    var fetchRecipeCallCount = 0
    var stubbedRecipes: [Recipe] = []
    var stubbedErrorString = ""
    var shouldAPISucceed: Bool = true
    
    init() {
        result = BehaviorRelay<Result<[Recipe], Error>>(value: .success([]))
    }
    public func fetchRecipes() {
      fetchRecipeCallCount += 1
      if shouldAPISucceed {
        result.accept(.success(stubbedRecipes))
      } else {
        let error = MockError.dummyError(message: stubbedErrorString)
        result.accept(.failure(error))
      }
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


