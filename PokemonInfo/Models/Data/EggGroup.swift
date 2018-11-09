//
//  EggGroup.swift
//  PokemonInfo
//
//  Created by yura on 11/7/18.
//  Copyright © 2018 TFM. All rights reserved.
//

import ObjectMapper

struct EggGroup: Mappable {
    
    var id: Int = 0
    var name: String?
    var names: [Language] = []
    var pokemonSpecies: [Pokemon] = []
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        id             <-     map["id"]
        name           <-     map["name"]
        names          <-     map["names"]
        pokemonSpecies <-     map["pokemon_species"]
    }
    
}

struct Language: Mappable {
    
    var name: String?
    var language: Name?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        name     <-    map["name"]
        language <-    map["language"]
    }
    
}
