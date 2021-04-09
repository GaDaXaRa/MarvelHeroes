//
//  HeroListViewController.swift
//  MarvelHeroes
//
//  Created by Miguel Santiago on 09/04/2021.
//

import UIKit

protocol HeroListPresenting: class {
    var view: HeroListView? {get set}
    var numItems: Int {get}
    func draw(cell: HeroCollectionViewCell, at indexPath: IndexPath)
    func didSelectItem(at indexPath: IndexPath)
}

class HeroListViewController: UIViewController, StoryboardAware {
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.view = self
    }
    
    var presenter: HeroListPresenting?
}

extension HeroListViewController: HeroListView {
    func reload() {
        collectionView.reloadData()
    }
}

extension HeroListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter?.numItems ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "heroCell", for: indexPath) as! HeroCollectionViewCell
        presenter?.draw(cell: cell, at: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.didSelectItem(at: indexPath)
    }
}
