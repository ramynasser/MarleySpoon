//
//  RecipeService.swift
//  MarleySpoon (iOS)
//
//  Created by Ramy Nasser on 08/09/2021.
//

import Contentful
import RxSwift
import RxCocoa

public protocol RecipeServiceProtocol {
  var result: BehaviorRelay<Result<[Recipe],Error>> { get }
  func fetchRecipes()
}

public struct RecipeService: RecipeServiceProtocol {

  public var result = BehaviorRelay<Result<[Recipe],Error>>(value: .success([]))
  private let client: Client
  
 public init() {
    client = Client(spaceId: Constants.spaceId,
                    accessToken: Constants.accessToken,
                    contentTypeClasses: [Recipe.self, Chef.self, Tag.self])
  }
  
 public func fetchRecipes() {
    let query = QueryOn<Recipe>.where(contentTypeId: "recipe")

    client.fetchArray(of: Recipe.self, matching: query) { (result: Result<HomogeneousArrayResponse<Recipe>, Error>) in
        switch result {
        case .success(let arrayResponse):
            let recipes = arrayResponse.items
            self.result.accept(.success(recipes))
        case .failure(let error):
            self.result.accept(.failure(error))
        }
    }
  }
}
