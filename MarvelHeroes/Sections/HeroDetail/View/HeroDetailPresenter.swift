//
//  HeroDetailPresenter.swift
//  MarvelHeroes
//
//  Created by Miguel Santiago on 09/04/2021.
//

import Foundation

protocol HeroDetailModel {
    var detailModel: HeroDetailViewModel {get}
}

protocol HeroDetailView: class {
    func configure(with viewModel: HeroDetailViewModel)
}

protocol HeroDetailRepository {
    func fetch(_ completion: @escaping (Result<HeroDetailModel, Error>) -> ())
}

class HeroDetailPresenter: HeroDetailPresenting {
    private let repository: HeroDetailRepository
    
    init(repository: HeroDetailRepository) {
        self.repository = repository
    }
    
    weak var view: HeroDetailView? {
        didSet {
            fetchItem()
        }
    }
    
    private var item: HeroDetailModel? {
        didSet {
            guard let item = item else {return}
            view?.configure(with: item.detailModel)
        }
    }
}

private extension HeroDetailPresenter {
    func fetchItem() {
        repository.fetch { [weak self] (result) in
            switch result {
            case .success(let item): self?.item = item
            case .failure(_): break
            }
        }
    }
}
