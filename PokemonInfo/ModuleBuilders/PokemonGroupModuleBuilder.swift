//
//  PokemonGroupModuleBuilder.swift
//  PokemonInfo
//
//  Created by Yurii Chudnovets on 1/3/19.
//  Copyright © 2019 TFM. All rights reserved.
//

import UIKit

class PokemonGroupModuleBuilder: ModuleBuilder {
    
    func create(with data: Any) -> UIViewController {
        let model = PokemonGroupModel(group: (data as? Int) ?? 0)
        let view = PokemonGroupVC(nibName: "PokemonGroupVC", bundle: nil)
        let presenter = PokemonGroupPresenter(view: view, groupDataModel: model)
        view.presenter = presenter
        return view
    }
    
}
