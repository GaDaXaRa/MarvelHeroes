//
//  WireframeProtocols.swift
//  MarvelHeroes
//
//  Created by Miguel Santiago on 09/04/2021.
//

import Foundation
import UIKit

protocol RootNavigationWireframe {
    var rootNavigation: UINavigationController? {get}
}

protocol Pushable {
    func push(viewController: @escaping @autoclosure () -> (UIViewController))
}

extension Pushable where Self: RootNavigationWireframe {
    func push(viewController: @escaping @autoclosure () -> (UIViewController)) {
        DispatchQueue.main.async {
            rootNavigation?.pushViewController(viewController(), animated: true)
        }
    }
}
