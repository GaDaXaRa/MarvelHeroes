//
//  ByIdHeroDetailRepository.swift
//  MarvelHeroes
//
//  Created by Miguel Santiago on 09/04/2021.
//

import Foundation

class ByIdHeroDetailRepository {
    private let heroId: Int
    private let fetchHeroes: FetchHeroesUseCase
    
    init(heroId: Int, fetchHeroes: FetchHeroesUseCase = FetchHeroes()) {
        self.heroId = heroId
        self.fetchHeroes = fetchHeroes
    }
}

extension ByIdHeroDetailRepository: HeroDetailRepository {
    func fetch(_ completion: @escaping (Result<HeroDetailModel, Error>) -> ()) {
        fetchHeroes.fetch(by: heroId) { result in
            completion(result.map({$0 as HeroDetailModel}))
        }
    }
}
 
