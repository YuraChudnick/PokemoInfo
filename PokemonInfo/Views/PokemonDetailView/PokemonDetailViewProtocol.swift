//
//  PokemonDetailView.swift
//  PokemonInfo
//
//  Created by yura on 11/6/18.
//  Copyright © 2018 TFM. All rights reserved.
//

import Foundation

protocol PokemonDetailViewProtocol: class {
    
    func setTitle(text: String?)
    
    func setPokemonImage(image: URL?)
    
    func setAbilities(abilities: [Ability])
    
}
