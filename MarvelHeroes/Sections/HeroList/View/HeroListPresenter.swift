//
//  HeroListPresenter.swift
//  MarvelHeroes
//
//  Created by Miguel Santiago on 09/04/2021.
//

import Foundation

protocol HeroListView: class {
    func reload()
}

protocol HeroListRepository {
    func fetchItems(_ completion: @escaping (Result<[MarvelHeroInList], Error>) -> ())
}

class HeroListPresenter {
    private let repository: HeroListRepository
    
    init(repository: HeroListRepository) {
        self.repository = repository
    }
    
    weak var view: HeroListView? {
        didSet {
            fetchItems()
        }
    }
    
    var items = [MarvelHeroInList]() {
        didSet {
            view?.reload()
        }
    }
}

private extension HeroListPresenter {
    func fetchItems() {
        repository.fetchItems { [weak self] (result) in
            switch result {
            case .success(let items): self?.items = items
            case.failure(let error): break
            }
        }
    }
}

extension HeroListPresenter: HeroListPresenting {
    var numItems: Int {
        items.count
    }
    
    func draw(cell: HeroCollectionViewCell, at indexPath: IndexPath) {
        cell.configure(with: items[indexPath.row].toCellModel)
    }
}

extension MarvelHeroInList {
    var toCellModel: HeroCellViewModel {
        .init(name: name)
    }
}
