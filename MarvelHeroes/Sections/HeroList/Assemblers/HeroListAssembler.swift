//
//  HeroListAssembler.swift
//  MarvelHeroes
//
//  Created by Miguel Santiago on 09/04/2021.
//

import Foundation
import UIKit

protocol HeroListAssembler {
    func resolve() -> UIViewController
    func resolve() -> HeroListPresenting
    func resolve() -> HeroListRepository
}

extension HeroListAssembler {
    func resolve() -> UIViewController {
        let vc = HeroListViewController.create()
        vc.presenter = resolve()
        return vc
    }
    
    func resolve() -> HeroListPresenting {
        HeroListPresenter(repository: resolve())
    }
    
    func resolve() -> HeroListRepository {
        AllHeroesRepository()
    }
}

class HeroList: HeroListAssembler {}
