//
//  PokemonSpecies.swift
//  PokemonInfo
//
//  Created by yura on 11/7/18.
//  Copyright © 2018 TFM. All rights reserved.
//

import ObjectMapper

struct PokemonSpecies: Mappable {
    
    var baseHappiness: Int?
    var captureRate: Int?
    var color: Name?
    var eggGroups: [Name] = []
    var flavorTextEntries: [FlavorText] = []
    var name: String?
    var id: Int?
    var hatchCounter: Int?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        baseHappiness     <-    map["base_happiness"]
        captureRate       <-    map["capture_rate"]
        color             <-    map["color"]
        eggGroups         <-    map["egg_groups"]
        flavorTextEntries <-    map["flavor_text_entries"]
        name              <-    map["name"]
        id                <-    map["id"]
        hatchCounter      <-    map["hatch_counter"]
    }
    
}
