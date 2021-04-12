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
    let description: String?
}

protocol HeroDetailPresenting: class {
    var view: HeroDetailView? {get set}
}

class HeroDetailViewController: UIViewController, Creatable {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var presenter: HeroDetailPresenting?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.view = self
    }
}

extension HeroDetailViewController: HeroDetailView {
    func configure(with viewModel: HeroDetailViewModel) {
        DispatchQueue.main.async {
            self.title = viewModel.name
            self.titleLabel.text = viewModel.name
            self.descriptionLabel.text = viewModel.description
            self.imageView.with(url: viewModel.imageUrl, showLoader: true)
        }
    }
}
