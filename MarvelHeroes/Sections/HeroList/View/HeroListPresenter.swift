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

protocol HeroListRouting {
    func didSelect(item: MarvelHeroInList)
}

class HeroListPresenter {
    private let repository: HeroListRepository?
    private let router: HeroListRouting?
    
    init(repository: HeroListRepository?, router: HeroListRouting?) {
        self.repository = repository
        self.router = router
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
        repository?.fetchItems { [weak self] (result) in
            switch result {
            case .success(let items): self?.items = items
            case.failure(_): break
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
    
    func didSelectItem(at indexPath: IndexPath) {
        router?.didSelect(item: items[indexPath.row])
    }
}

extension MarvelHeroInList {
    var toCellModel: HeroCellViewModel {
        .init(name: name)
    }
}
