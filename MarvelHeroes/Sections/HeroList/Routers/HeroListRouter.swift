//
//  HeroListRouter.swift
//  MarvelHeroes
//
//  Created by Miguel Santiago on 09/04/2021.
//

import Foundation

protocol HeroListWireframe: HeroDetailOpener, ErrorPresentable {}

class HeroListRouter {
    private let wireframe: HeroListWireframe?
    
    init(wireframe: HeroListWireframe?) {
        self.wireframe = wireframe
    }
}

extension HeroListRouter: HeroListRouting {
    func didSelect(item: HeroInListModel) {
        guard let model = item as? MarvelHeroInList else {return}
        wireframe?.openDetail(for: model)
    }
    
    func didFail(with error: Error) {
        wireframe?.show(error: error)
    }
}
