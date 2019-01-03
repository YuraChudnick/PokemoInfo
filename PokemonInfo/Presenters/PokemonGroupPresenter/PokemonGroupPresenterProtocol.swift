//
//  PokemonGroupPresenter.swift
//  PokemonInfo
//
//  Created by yura on 11/6/18.
//  Copyright © 2018 TFM. All rights reserved.
//

protocol PokemonGroupPresenterProtocol: class {
    
    init(view: PokemonGroupViewProtocol, groupDataModel: PokemonGroupModelProtocol)
    
    func loadData()
    
    func showDetailInfo(at index: Int)
    
    func search(_ text: String)
    
}
