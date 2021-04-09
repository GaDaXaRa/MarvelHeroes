//
//  RootWireframe.swift
//  MarvelHeroes
//
//  Created by Miguel Santiago on 09/04/2021.
//

import Foundation
import UIKit

class RootWireframe: RootNavigationWireframe {
    private var initialController: UINavigationController {
        UINavigationController(rootViewController: HeroList().resolve(wireframe: self))
    }
    
    init() {
        rootNavigation = initialController
    }
    
    var rootNavigation: UINavigationController?
}

extension RootWireframe: Pushable {}

extension RootWireframe: HeroDetailOpener, HeroListWireframe {}
