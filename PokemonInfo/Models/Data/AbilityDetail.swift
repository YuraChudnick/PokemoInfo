//
//  AbilityDetail.swift
//  PokemonInfo
//
//  Created by yura on 11/8/18.
//  Copyright © 2018 TFM. All rights reserved.
//

import ObjectMapper

struct AbilityDetail: Mappable {
    
    var effectEntries: [EffectEntry] = []
    var flavorTextEntries: [FlavorText] = []
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        effectEntries     <-   map["effect_entries"]
        flavorTextEntries <-   map["flavor_text_entries"]
    }
    
    func getEffectDescription() -> String {
        var descStr = ""
        for effect in effectEntries {
            descStr += effect.effect
        }
        return descStr
    }
    
}

struct EffectEntry: Mappable {
    
    var effect: String = ""
    var shortEffect: String = ""
    var language: Name?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        effect      <-    map["effect"]
        shortEffect <-    map["short_effect"]
        language    <-    map["language"]
    }
    
}
