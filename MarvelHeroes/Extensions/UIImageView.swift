//
//  UIImageView.swift
//  MarvelHeroes
//
//  Created by Miguel Santiago on 10/04/2021.
//

import UIKit
import Kingfisher

extension UIImageView {
    func with(url: URL?, showLoader: Bool = false) {
        let processor = DownsamplingImageProcessor(size: bounds.size)
        self.kf.indicatorType = showLoader ? .activity : .none
        self.kf.setImage(with: url, options: [
            .processor(processor),
            .scaleFactor(UIScreen.main.scale),
            .transition(.fade(0.4)),
            .cacheOriginalImage
        ])
    }
}
