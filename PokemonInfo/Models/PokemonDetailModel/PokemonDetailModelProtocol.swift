//
//  DetailModel.swift
//  PokemonInfo
//
//  Created by yura on 11/8/18.
//  Copyright © 2018 TFM. All rights reserved.
//

protocol PokemonDetailModelProtocol {
    
    func saveAbilityRate(rate: Double, for abilityName: String)
    
    func getAbilityRate(with abilityName: String) -> Double?
}
