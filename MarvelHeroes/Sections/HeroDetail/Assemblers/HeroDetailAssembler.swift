//
//  HeroDetailAssembler.swift
//  MarvelHeroes
//
//  Created by Miguel Santiago on 09/04/2021.
//

import Foundation
import UIKit

protocol HeroDetailAssembler {
    func resolve(hero: MarvelHeroInList) -> UIViewController
    func resolve(hero: MarvelHeroInList) -> HeroDetailPresenting
    func resolve(hero: MarvelHeroInList) -> HeroDetailRepository
}

extension HeroDetailAssembler {
    func resolve(hero: MarvelHeroInList) -> UIViewController {
        let vc = HeroDetailViewController.create()
        vc.presenter = resolve(hero: hero)
        return vc
    }
    
    func resolve(hero: MarvelHeroInList) -> HeroDetailPresenting {
        HeroDetailPresenter(repository: resolve(hero: hero))
    }
    
    func resolve(hero: MarvelHeroInList) -> HeroDetailRepository {
        InMemoryHeroDetailRepository(hero: hero)
    }
}

class HeroDetail: HeroDetailAssembler {}
