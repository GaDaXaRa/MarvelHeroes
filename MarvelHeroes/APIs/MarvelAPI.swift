//
//  MarvelAPI.swift
//  MarvelHeroes
//
//  Created by Miguel Santiago on 09/04/2021.
//

import Foundation

enum MarvelAPI: ApiCall {
    case heroList(offset: Int, limit: Int), heroDetail(id: Int)
    
    var baseUrl: String {"http://gateway.marvel.com/v1/public"}
    var verb: ApiVerb {.GET}
    
    var path: String {
        switch self {
        case .heroList: return "characters"
        case .heroDetail(let characterId): return "characters/\(characterId)"
        }
    }
    
    private var defaultLimit: Int {
        50
    }
    
    var params: [String : Any]? {
        let ts = Int(Date().timeIntervalSince1970)
        let privateKey = Bundle.main.marvelPrivateKey
        let publicKey = Bundle.main.marvelPublicKey
        let hash = "\(ts)\(privateKey)\(publicKey)".md5Hex
        return ["ts": ts, "apikey": publicKey, "hash": hash, "limit": limit, "offset": offset]
    }
    
    private var offset: Int {
        switch self {
        case .heroList(let offset, _): return offset
        default: return 0
        }
    }
    
    private var limit: Int {
        switch self {
        case .heroList(_,  let limit): return limit
        default: return defaultLimit
        }
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
    let description: String?
    let thumbnail: MarvelImage?
}

extension MarvelHeroInList: HeroInListModel {
    var cellModel: HeroCellViewModel {.init(name: name, imageUrl: thumbnail?.imageUrl(size: .xlarge, orientation: .portrait))}
}

extension MarvelHeroInList: HeroDetailModel {
    var detailModel: HeroDetailViewModel {
        .init(imageUrl: thumbnail?.imageUrl(size: .amazing, orientation: .landscape), name: name, description: description)
    }
}

struct MarvelImage: Codable {
    let path: String
    let `extension`: String
}

enum ImageSize: String {
    case small, medium, xlarge, amazing
}

enum ImageOrientation: String {
    case portrait, standard, landscape
}

extension MarvelImage {
    func imageUrl(size: ImageSize = .medium, orientation: ImageOrientation = .standard) -> URL? {
        var url = URL(string: path)
        url?.appendPathComponent("\(orientation)_\(size)")
        url?.appendPathExtension(`extension`)
        return url
    }
}
