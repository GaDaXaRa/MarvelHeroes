//
//  ViewProtocols.swift
//  MarvelHeroes
//
//  Created by Miguel Santiago on 09/04/2021.
//

import Foundation
import UIKit

protocol StoryboardAware {
    static func create() -> Self
}

extension StoryboardAware where Self: UIViewController {
    static func create() -> Self {
        UIStoryboard(name: String(describing: self), bundle: Bundle(for: self))
            .instantiateViewController(withIdentifier: String(describing: self)) as! Self
    }
}
