//
//  FetchHeroesUseCase.swift
//  MarvelHeroes
//
//  Created by Miguel Santiago on 09/04/2021.
//

import Foundation

protocol FetchHeroesUseCase {
    func fetch(_ completion: @escaping (Result<[MarvelHeroInList], Error>) -> ())
}

class FetchHeroes {
    private let apiRouter: ApiRouting
    
    init(apiRouter: ApiRouting = AFApiRouter()) {
        self.apiRouter = apiRouter
    }
}

extension FetchHeroes: FetchHeroesUseCase {
    func fetch(_ completion: @escaping (Result<[MarvelHeroInList], Error>) -> ()) {
        apiRouter.request(apiCall: MarvelAPI.heroList) { (result: Result<MarvelResponseContainer, Error>) in
            completion(result.map({$0.data.results}))
        }
    }
}
