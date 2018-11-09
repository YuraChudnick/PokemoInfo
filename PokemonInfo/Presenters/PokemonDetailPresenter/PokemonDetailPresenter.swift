//
//  PokemonDetailPresenter.swift
//  PokemonInfo
//
//  Created by yura on 11/6/18.
//  Copyright © 2018 TFM. All rights reserved.
//

import UIKit

class PokemonDetailPresenter: NSObject, PokemonDetailViewPresenter {
    
    unowned let view: PokemonDetailView
    let detailModel: PokemonDetailModel
    
    let cellId = "AbilityCell"
    
    required init(view: PokemonDetailView, detailModel: PokemonDetailModel) {
        self.view = view
        self.detailModel = detailModel
    }
    
    func showDetailInfo() {
        view.setTitle(text: detailModel.pokemonInfo.name)
        view.setPokemonImage(image: detailModel.pokemonInfo.abilities?.sprites?.getUrlForDefaultImage())
    }
    
}

extension PokemonDetailPresenter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailModel.pokemonInfo.abilities?.abilities.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! AbilityCell
        let ability = detailModel.pokemonInfo.abilities?.abilities[indexPath.row]
        cell.nameLabel.text = ability?.ability?.name
        cell.descriptionLabel.text = "Loading..."
        ability?.loadAbilitiesDetail(handler: { (success) in
            if success {
                cell.descriptionLabel.text = ability?.abilityDetail?.getEffectDescription()
                tableView.reloadRows(at: [indexPath], with: .automatic)
            } else {
                cell.descriptionLabel.text = "No Data"
            }
        })
        let key = (detailModel.pokemonInfo.name ?? "no_name") + "_" + (ability?.ability?.name ?? "no_ability")
        cell.rateView.rating = detailModel.getAbilityRate(with: key) ?? 0
        cell.rateView.didFinishTouchingCosmos = { [weak self] (rate) in
            self?.detailModel.saveAbilityRate(rate: rate, for: key)
        }
        return cell
    }
    
}
