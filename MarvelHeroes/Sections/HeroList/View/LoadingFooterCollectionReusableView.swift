//
//  LoadingFooterCollectionReusableView.swift
//  MarvelHeroes
//
//  Created by Miguel Santiago on 12/04/2021.
//

import UIKit

class LoadingFooterCollectionReusableView: UICollectionReusableView {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    func showLoad() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    
    func hideLoad() {
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
    
}
