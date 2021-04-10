//
//  HeroDetailAssembler.swift
//  MarvelHeroes
//
//  Created by Miguel Santiago on 09/04/2021.
//

import Foundation
import UIKit

protocol HeroDetailAssembler {
    func resolve() -> UIViewController
    func resolve() -> HeroDetailPresenting
    func resolve() -> HeroDetailRepository
}

extension HeroDetailAssembler {
    func resolve() -> UIViewController {
        let vc = HeroDetailViewController.create()
        vc.presenter = resolve()
        return vc
    }
    
    func resolve() -> HeroDetailPresenting {
        HeroDetailPresenter(repository: resolve())
    }
}

class HeroDetailByModel: HeroDetailAssembler {
    private let hero: MarvelHeroInList
    
    init(hero: MarvelHeroInList) {
        self.hero = hero
    }
    
    func resolve() -> HeroDetailRepository {
        InMemoryHeroDetailRepository(hero: hero)
    }
}

class HeroDetailById: HeroDetailAssembler {
    private let heroId: Int
    
    init(heroId: Int) {
        self.heroId = heroId
    }
    
    func resolve() -> HeroDetailRepository {
        ByIdHeroDetailRepository(heroId: heroId)
    }
}
