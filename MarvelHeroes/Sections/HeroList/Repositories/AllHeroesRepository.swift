//
//  AllHeroesRepository.swift
//  MarvelHeroes
//
//  Created by Miguel Santiago on 09/04/2021.
//

import Foundation

class AllHeroesRepository {
    private let fetchHeroes: FetchHeroesUseCase
    
    init(fetchHeroes: FetchHeroesUseCase = FetchHeroes()) {
        self.fetchHeroes = fetchHeroes
    }
}

extension AllHeroesRepository: HeroListRepository {
    func fetchItems(_ completion: @escaping (Result<[MarvelHeroInList], Error>) -> ()) {
        fetchHeroes.fetch(completion)
    }
}
