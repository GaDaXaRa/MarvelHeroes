//
//  MarvelAPI.swift
//  MarvelHeroes
//
//  Created by Miguel Santiago on 09/04/2021.
//

import Foundation

enum MarvelAPI: ApiCall {
    case heroList, heroDetail(Int)
    
    var baseUrl: String {"http://gateway.marvel.com/v1/public"}
    var verb: ApiVerb {.GET}
    
    var path: String {
        switch self {
        case .heroList: return "characters"
        case .heroDetail(let characterId): return "characters/\(characterId)"
        }
    }
    
    var params: [String : Any]? {
        let ts = Int(Date().timeIntervalSince1970)
        let privateKey = Bundle.main.marvelPrivateKey
        let publicKey = Bundle.main.marvelPublicKey
        let hash = "\(ts)\(privateKey)\(publicKey)".md5Hex
        return ["ts": ts, "apikey": publicKey, "hash": hash]
    }
}

struct MarvelResponseContainer: Codable {
    let data: MarvelResultsContainer
}

extension MarvelResponseContainer {
    var heroes: [MarvelHeroInList] {data.results}
}

struct MarvelResultsContainer: Codable {
    let results: [MarvelHeroInList]
}

struct MarvelHeroInList: Codable {
    let id: Int
    let name: String
}
