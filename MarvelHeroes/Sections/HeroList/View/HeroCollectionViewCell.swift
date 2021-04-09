//
//  HeroCollectionViewCell.swift
//  MarvelHeroes
//
//  Created by Miguel Santiago on 09/04/2021.
//

import UIKit

struct HeroCellViewModel {
    let name: String
}

class HeroCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    
    func configure(with viewModel: HeroCellViewModel) {
        nameLabel.text = viewModel.name
    }
}
