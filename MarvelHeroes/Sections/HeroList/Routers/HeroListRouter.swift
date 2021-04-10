//
//  HeroListRouter.swift
//  MarvelHeroes
//
//  Created by Miguel Santiago on 09/04/2021.
//

import Foundation

protocol HeroListWireframe: HeroDetailOpener {}

class HeroListRouter {
    private let wireframe: HeroListWireframe?
    
    init(wireframe: HeroListWireframe?) {
        self.wireframe = wireframe
    }
}

extension HeroListRouter: HeroListRouting {
    func didSelect(item: MarvelHeroInList) {
//        wireframe?.openDetail(for: item)
        wireframe?.presentDetail(byHeroId: item.id)
    }
}
