//
//  Pokemons.swift
//  PokemonInfo
//
//  Created by yura on 11/6/18.
//  Copyright © 2018 TFM. All rights reserved.
//

import ObjectMapper

struct PokemonResponse: Mappable {
    
    var count: Int = 0
    var next: String?
    var previous: String?
    var results: [Pokemon] = []
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        count     <-   map["count"]
        next      <-   map["next"]
        previous  <-   map["previous"]
        results   <-   map["results"]
    }
    
}
