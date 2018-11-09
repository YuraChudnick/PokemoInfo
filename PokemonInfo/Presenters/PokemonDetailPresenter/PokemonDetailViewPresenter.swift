//
//  PokemonDetailViewPresenter.swift
//  PokemonInfo
//
//  Created by yura on 11/6/18.
//  Copyright © 2018 TFM. All rights reserved.
//

import Foundation

protocol PokemonDetailViewPresenter: class {
    
    init(view: PokemonDetailView, detailModel: PokemonDetailModel)
    
    func showDetailInfo()
    
}
