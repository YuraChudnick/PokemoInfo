//
//  PokemonDetailModuleBuilder.swift
//  PokemonInfo
//
//  Created by Yurii Chudnovets on 1/3/19.
//  Copyright © 2019 TFM. All rights reserved.
//

import UIKit

class PokemonDetailModuleBuilder: ModuleBuilder {
    
    func create(with data: Any) -> UIViewController {
        let model = PokemonDetailModel()
        model.pokemonInfo = data as? Pokemon
        let view = PokemonDetailVC(nibName: "PokemonDetailVC", bundle: nil)
        let presenter = PokemonDetailPresenter(view: view, detailModel: model)
        view.presenter = presenter
        view.hidesBottomBarWhenPushed = true
        return view
    }
    
}
