//
//  HeroDetailViewController.swift
//  MarvelHeroes
//
//  Created by Miguel Santiago on 09/04/2021.
//

import UIKit

struct HeroDetailViewModel {
    let imageUrl: URL?
    let name: String
}

protocol HeroDetailPresenting: class {
    var view: HeroDetailView? {get set}
}

class HeroDetailViewController: UIViewController, Creatable {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var presenter: HeroDetailPresenting?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.view = self
    }
}

extension HeroDetailViewController: HeroDetailView {
    func configure(with viewModel: HeroDetailViewModel) {
        titleLabel.text = viewModel.name
        imageView.with(url: viewModel.imageUrl)
    }
}
