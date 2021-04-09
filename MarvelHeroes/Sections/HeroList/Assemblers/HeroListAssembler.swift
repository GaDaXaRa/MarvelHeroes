//
//  HeroListAssembler.swift
//  MarvelHeroes
//
//  Created by Miguel Santiago on 09/04/2021.
//

import Foundation
import UIKit

protocol HeroListAssembler {
    func resolve(wireframe: HeroListWireframe) -> UIViewController
    func resolve(wireframe: HeroListWireframe) -> HeroListPresenting
    func resolve(wireframe: HeroListWireframe) -> HeroListRouting
    func resolve() -> HeroListRepository
}

extension HeroListAssembler {
    func resolve(wireframe: HeroListWireframe) -> UIViewController {
        let vc = HeroListViewController.create()
        vc.presenter = resolve(wireframe: wireframe)
        return vc
    }
    
    func resolve(wireframe: HeroListWireframe) -> HeroListPresenting {
        HeroListPresenter(repository: resolve(), router: resolve(wireframe: wireframe))
    }
    
    func resolve(wireframe: HeroListWireframe) -> HeroListRouting {
        HeroListRouter(wireframe: wireframe)
    }
    
    func resolve() -> HeroListRepository {
        AllHeroesRepository()
    }
}

class HeroList: HeroListAssembler {}
