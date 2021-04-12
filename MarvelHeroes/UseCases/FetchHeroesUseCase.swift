//
//  FetchHeroesUseCase.swift
//  MarvelHeroes
//
//  Created by Miguel Santiago on 09/04/2021.
//

import Foundation

protocol FetchHeroesUseCase {
    func fetch(_ completion: @escaping (Result<[MarvelHeroInList], Error>) -> ())
    func fetch(offset: Int, _ completion: @escaping (Result<[MarvelHeroInList], Error>) -> ())
    func fetch(by id: Int, _ completion: @escaping (Result<MarvelHeroInList, Error>) -> ())
}

class FetchHeroes {
    private let apiRouter: ApiRouting
    
    init(apiRouter: ApiRouting = AFApiRouter()) {
        self.apiRouter = apiRouter
    }
}

extension FetchHeroes: FetchHeroesUseCase {
    func fetch(offset: Int, _ completion: @escaping (Result<[MarvelHeroInList], Error>) -> ()) {
        apiRouter.request(apiCall: MarvelAPI.heroList(offset: offset)) { (result: Result<MarvelResponseContainer, Error>) in
            completion(result.map({$0.heroes}))
        }
    }
    
    func fetch(_ completion: @escaping (Result<[MarvelHeroInList], Error>) -> ()) {
        fetch(offset: 0, completion)
    }
    
    func fetch(by id: Int, _ completion: @escaping (Result<MarvelHeroInList, Error>) -> ()) {
        apiRouter.request(apiCall: MarvelAPI.heroDetail(id: id)) { (result: Result<MarvelResponseContainer, Error>) in
            completion(result.map({$0.heroes.first!}))
        }
    }
}
