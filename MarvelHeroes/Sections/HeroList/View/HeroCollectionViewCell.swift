//
//  HeroCollectionViewCell.swift
//  MarvelHeroes
//
//  Created by Miguel Santiago on 09/04/2021.
//

import UIKit

struct HeroCellViewModel {
    let name: String
    let imageUrl: URL?
}

class HeroCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelContainerView: UIView! {
        didSet {
            labelContainerView.alpha = 0.7
        }
    }
    
    func configure(with viewModel: HeroCellViewModel) {
        nameLabel.text = viewModel.name
        imageView.with(url: viewModel.imageUrl)
    }
}
