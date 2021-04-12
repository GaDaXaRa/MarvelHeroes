//
//  HeroListPresenter.swift
//  MarvelHeroes
//
//  Created by Miguel Santiago on 09/04/2021.
//

import Foundation

protocol HeroInListModel {
    var cellModel: HeroCellViewModel {get}
}

protocol HeroListView: class {
    func reload()
    func showLoading(_ loading: Bool)
}

protocol HeroListRepository {
    func fetchItems(offset: Int, _ completion: @escaping (Result<[HeroInListModel], Error>) -> ())
}

protocol HeroListRouting {
    func didSelect(item: HeroInListModel)
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
    
    var items = [HeroInListModel]() {
        didSet {
            view?.reload()
        }
    }
    
    private var loading = false {
        didSet {
            view?.showLoading(loading)
        }
    }
}

private extension HeroListPresenter {
    func fetchItems() {
        guard !loading else {return}
        loading = true
        repository?.fetchItems(offset: items.count) { [weak self] (result) in
            switch result {
            case .success(let items): self?.items.append(contentsOf: items)
            case.failure(_): break
            }
            self?.loading = false
        }
    }
}

extension HeroListPresenter: HeroListPresenting {
    var numItems: Int {
        items.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> HeroCellViewModel? {
        items[indexPath.row].cellModel
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        router?.didSelect(item: items[indexPath.row])
    }
    
    func didScrollToBottom() {
        fetchItems()
    }
}
