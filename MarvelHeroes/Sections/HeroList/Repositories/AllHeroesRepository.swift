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
    func fetchItems(offset: Int, _ completion: @escaping (Result<[HeroInListModel], Error>) -> ()) {
        fetchHeroes.fetch(offset: offset) { result in
            completion(result.map({$0 as [HeroInListModel]}))
        }
    }
}
