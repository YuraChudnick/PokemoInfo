//
//  PokemonDetailPresenter.swift
//  PokemonInfo
//
//  Created by yura on 11/6/18.
//  Copyright © 2018 TFM. All rights reserved.
//

class PokemonDetailPresenter: PokemonDetailPresenterPresenter {

    unowned let view: PokemonDetailViewProtocol
    let detailModel: PokemonDetailModel
    
    required init(view: PokemonDetailViewProtocol, detailModel: PokemonDetailModel) {
        self.view = view
        self.detailModel = detailModel
    }
    
    func showDetailInfo() {
        view.setTitle(text: detailModel.pokemonInfo.name)
        view.setPokemonImage(image: detailModel.pokemonInfo.abilities?.sprites?.getUrlForDefaultImage())
        view.setAbilities(abilities: detailModel.pokemonInfo?.abilities?.abilities ?? [])
    }
    
    func ratingChanged(rate: Double, for abilityName: String) {
        detailModel.saveAbilityRate(rate: rate, for: abilityName)
    }
    
    func showAbilityRate(for abilityName: String, result: @escaping (Double) -> Void) {
        result(detailModel.getAbilityRate(with: abilityName) ?? 0)
    }
    
}
