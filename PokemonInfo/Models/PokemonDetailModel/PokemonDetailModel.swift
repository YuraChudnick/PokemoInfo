//
//  PokemonDetailModel.swift
//  PokemonInfo
//
//  Created by yura on 11/6/18.
//  Copyright © 2018 TFM. All rights reserved.
//

import Foundation

class PokemonDetailModel: PokemonDetailModelProtocol {
    
    var pokemonInfo: Pokemon!
    
    func saveAbilityRate(rate: Double, for abilityName: String) {
        UserDefaults.standard.set(rate, forKey: generateKey(with: abilityName))
    }
    
    func getAbilityRate(with abilityName: String) -> Double? {
        return UserDefaults.standard.value(forKey: generateKey(with: abilityName)) as? Double
    }
    
    private func generateKey(with abilityName: String) -> String {
        return (pokemonInfo.name ?? "no_name") + "_" + abilityName
    }
    
}
