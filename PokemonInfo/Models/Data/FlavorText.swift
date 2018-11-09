//
//  FlavorText.swift
//  PokemonInfo
//
//  Created by yura on 11/7/18.
//  Copyright © 2018 TFM. All rights reserved.
//

import ObjectMapper

struct FlavorText: Mappable {
    
    var flavorText: String?
    var language: Name?
    var version: Name?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        flavorText    <-    map["flavor_text"]
        language      <-    map["language"]
        version       <-    map["version"]
    }
    
}
