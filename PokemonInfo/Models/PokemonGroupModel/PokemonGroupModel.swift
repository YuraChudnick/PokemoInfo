//
//  GroupDataModel.swift
//  PokemonInfo
//
//  Created by yura on 11/6/18.
//  Copyright © 2018 TFM. All rights reserved.
//

class PokemonGroupModel: PokemonGroupModelProtocol {

    private var limit = 10
    private var offset = 0
    private var eggGroup: EggGroup?
    private var isFiltering: Bool = false
    private var filteredGroupItems: [Pokemon] = []
    let group: Int
    
    required init(group: Int) {
        self.group = group
    }
    
    func getGroup() -> EggGroup? {
        return eggGroup
    }
    
    func getPokemons() -> [Pokemon] {
        return isFiltering ? filteredGroupItems : (eggGroup?.pokemonSpecies ?? [])
    }
    
    func getGroupItemsCount() -> Int {
        return isFiltering ? filteredGroupItems.count : (eggGroup?.pokemonSpecies.count ?? 0)
    }
    
    func getGroupItem(at index: Int) -> Pokemon? {
        return isFiltering ? filteredGroupItems[index] : eggGroup?.pokemonSpecies[index]
    }
    
    func loadGroup(handler: @escaping (Bool) -> Void) {
        NetworkTask<EggGroup>(request: PokemonRequest.group(number: group)).execute { [weak self] (response) in
            switch response {
            case .data(let data):
                self?.eggGroup = data as? EggGroup
                handler(true)
            case .error(let status, let error):
                handler(false)
                print("Error: \(error?.localizedDescription ?? "some error"). Status: \(status ?? -1)")
            }
        }
    }
    
    func search(_ text: String) {
        guard let items = eggGroup?.pokemonSpecies, !text.isEmpty else {
            isFiltering = false
            return
        }
        filteredGroupItems = items.filter({ (pokemon) -> Bool in
            return (pokemon.name ?? "").lowercased().contains(text.lowercased()) || (pokemon.abilities?.getAbilitiesDescription() ?? "").lowercased().contains(text.lowercased())
        })
        isFiltering = true
    }
    
}
