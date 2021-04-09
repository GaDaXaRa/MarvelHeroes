//
//  HeroDetailOpener.swift
//  MarvelHeroes
//
//  Created by Miguel Santiago on 09/04/2021.
//

import Foundation

protocol HeroDetailOpener {
    func openDetail(for hero: MarvelHeroInList)
}

extension HeroDetailOpener where Self: Pushable {
    func openDetail(for hero: MarvelHeroInList) {
        push(viewController: HeroDetail().resolve(hero: hero))
    }
}
