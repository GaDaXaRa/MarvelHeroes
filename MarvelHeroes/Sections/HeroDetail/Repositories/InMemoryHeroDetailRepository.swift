//
//  InMemoryHeroDetailRepository.swift
//  MarvelHeroes
//
//  Created by Miguel Santiago on 09/04/2021.
//

import Foundation

class InMemoryHeroDetailRepository {
    private let hero: MarvelHeroInList
    
    init(hero: MarvelHeroInList) {
        self.hero = hero
    }
}

extension InMemoryHeroDetailRepository: HeroDetailRepository {
    func fetch(_ completion: @escaping (Result<HeroDetailModel, Error>) -> ()) {
        completion(.success(hero as HeroDetailModel))
    }
}
