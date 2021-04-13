//
//  String.swift
//  MarvelHeroes
//
//  Created by Miguel Santiago on 13/04/2021.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
