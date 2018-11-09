//
//  PokemonGroupPresenter.swift
//  PokemonInfo
//
//  Created by yura on 11/6/18.
//  Copyright © 2018 TFM. All rights reserved.
//

import UIKit
import Kingfisher

class PokemonGroupPresenter: NSObject, PokemonGroupViewPresenter {
    
    unowned let view: PokemonGroupView
    let groupDataModel: GroupModel
    
    let cellId = "PokemonCell"
    
    required init(view: PokemonGroupView, groupDataModel: GroupModel) {
        self.groupDataModel = groupDataModel
        self.view = view
    }
    
    func loadData() {
        groupDataModel.loadGroup { (success) in
            self.view.stopActivityIndicator()
            if success {
                self.view.setTabBarTitle(title: self.groupDataModel.getGroup()?.name ?? "Group\(self.groupDataModel.group)")
                self.view.reloadData()
            }
        }
    }
    
    func showDetailInfo(at index: Int) {
        guard let pokemon = groupDataModel.getGroupItem(at: index) else { return }
        view.showDetailView(detailView: PokemonDetailVC.createModule(pokemon: pokemon))
    }
    
    func search(_ text: String) {
        groupDataModel.search(text)
        view.reloadData()
    }
    
}

extension PokemonGroupPresenter: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PokemonCell
        let pokemon = groupDataModel.getGroupItem(at: indexPath.row)
        cell.nameLabel.text = pokemon?.name
        cell.imageView.image = nil
        cell.descriptionLabel.text = "Loading..."
        pokemon?.loadAbilities { (success) in
            if success {
                cell.imageView.kf.indicatorType = .activity
                cell.imageView.kf.setImage(with: pokemon?.abilities?.sprites?.getUrlForDefaultImage())
                cell.descriptionLabel.text = pokemon?.abilities?.getAbilitiesDescription()
            } else {
                cell.descriptionLabel.text = "No Data"
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groupDataModel.getGroupItemsCount()
    }
    
}
