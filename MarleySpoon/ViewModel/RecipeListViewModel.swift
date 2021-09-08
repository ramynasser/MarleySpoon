//
//  RecipeListViewModel.swift
//  MarleySpoon (iOS)
//
//  Created by Ramy Nasser on 08/09/2021.
//

import RxSwift
import Combine

public class RecipeListViewModel: ObservableObject {
    private let disposeBag = DisposeBag()
    private let service: RecipeServiceProtocol

    @Published public var error: String = ""
    @Published public var recipes: [Recipe] = []

    public init(service: RecipeServiceProtocol = RecipeService()) {
        
     self.service = service
        
        service.result.asDriver().asObservable().subscribe(onNext: { [weak self] result in
        guard let self = self else {
            return
        }
        switch result {
        case .success(let recipes):
            self.recipes = recipes
        case .failure(let error):
            self.error = error.localizedDescription
        }
      }).disposed(by: disposeBag)
        
    }
    
    public func fetchRecipes() {
        service.fetchRecipes()
    }
}
