//
//  PokemonGroupPresenter.swift
//  PokemonInfo
//
//  Created by yura on 11/6/18.
//  Copyright © 2018 TFM. All rights reserved.
//

class PokemonGroupPresenter: PokemonGroupPresenterProtocol {
    
    unowned let view: PokemonGroupViewProtocol
    let groupDataModel: PokemonGroupModelProtocol
    
    required init(view: PokemonGroupViewProtocol, groupDataModel: PokemonGroupModelProtocol) {
        self.groupDataModel = groupDataModel
        self.view = view
    }
    
    func loadData() {
        groupDataModel.loadGroup { (success) in
            self.view.stopActivityIndicator()
            if success {
                self.view.setTabBarTitle(title: self.groupDataModel.getGroup()?.name ?? "Group\(self.groupDataModel.group)")
                self.view.setPokemons(list: self.groupDataModel.getGroup()?.pokemonSpecies ?? [])
            }
        }
    }
    
    func showDetailInfo(at index: Int) {
        guard let pokemon = groupDataModel.getGroupItem(at: index) else { return }
        view.showDetailView(detailView: PokemonDetailModuleBuilder().create(with: pokemon))
    }
    
    func search(_ text: String) {
        groupDataModel.search(text)
        view.setPokemons(list: groupDataModel.getPokemons())
    }
    
}
