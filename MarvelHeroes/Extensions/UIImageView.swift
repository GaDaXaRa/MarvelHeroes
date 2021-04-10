//
//  UIImageView.swift
//  MarvelHeroes
//
//  Created by Miguel Santiago on 10/04/2021.
//

import UIKit
import Kingfisher

extension UIImageView {
    func with(url: URL?) {
        self.kf.setImage(with: url)
    }
}
