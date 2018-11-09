//
//  PokemonDetailModel.swift
//  PokemonInfo
//
//  Created by yura on 11/6/18.
//  Copyright © 2018 TFM. All rights reserved.
//

import Foundation

class PokemonDetailModel: DetailModel {
    
    var pokemonInfo: Pokemon!
    
    func saveAbilityRate(rate: Double, for key: String) {
        UserDefaults.standard.set(rate, forKey: key)
    }
    
    func getAbilityRate(with key: String) -> Double? {
        return UserDefaults.standard.value(forKey: key) as? Double
    }
    
}
