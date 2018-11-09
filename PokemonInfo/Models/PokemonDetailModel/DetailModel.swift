//
//  DetailModel.swift
//  PokemonInfo
//
//  Created by yura on 11/8/18.
//  Copyright © 2018 TFM. All rights reserved.
//

import Foundation

protocol DetailModel {
    func saveAbilityRate(rate: Double, for key: String)
    func getAbilityRate(with key: String) -> Double?
}
