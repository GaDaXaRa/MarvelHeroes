//
//  Bundle.swift
//  MarvelHeroes
//
//  Created by Miguel Santiago on 09/04/2021.
//

import Foundation

extension Bundle {
    var marvelPublicKey: String {object(forInfoDictionaryKey: "MARVEL_API_PUBLIC_KEY") as! String}
    var marvelPrivateKey: String {object(forInfoDictionaryKey: "MARVEL_API_PRIVATE_KEY") as! String}
}
