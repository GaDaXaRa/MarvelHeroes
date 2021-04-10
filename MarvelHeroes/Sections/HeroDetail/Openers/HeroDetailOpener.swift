//
//  HeroDetailOpener.swift
//  MarvelHeroes
//
//  Created by Miguel Santiago on 09/04/2021.
//

import Foundation

protocol HeroDetailOpener {
    func openDetail(for hero: MarvelHeroInList)
    func presentDetail(byHeroId heroId: Int)
}

extension HeroDetailOpener where Self: Pushable {
    func openDetail(for hero: MarvelHeroInList) {
        push(viewController: HeroDetailByModel(hero: hero).resolve())
    }
}

extension HeroDetailOpener where Self: Presentable {
    func presentDetail(byHeroId heroId: Int) {
        present(viewController: HeroDetailById(heroId: heroId).resolve())
    }
}
