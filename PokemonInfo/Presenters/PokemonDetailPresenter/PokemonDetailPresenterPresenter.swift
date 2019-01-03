//
//  PokemonDetailViewPresenter.swift
//  PokemonInfo
//
//  Created by yura on 11/6/18.
//  Copyright © 2018 TFM. All rights reserved.
//

protocol PokemonDetailPresenterPresenter: class {
    
    init(view: PokemonDetailViewProtocol, detailModel: PokemonDetailModel)
    
    func showDetailInfo()
    
    func ratingChanged(rate: Double,for abilityName: String)
 
    func showAbilityRate(for abilityName: String, result: @escaping (Double) -> Void)
    
}
