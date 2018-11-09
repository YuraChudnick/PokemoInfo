//
//  PokemonAbilities.swift
//  PokemonInfo
//
//  Created by yura on 11/8/18.
//  Copyright © 2018 TFM. All rights reserved.
//

import ObjectMapper

struct PokemonAbilities: Mappable {
    
    var id: Int?
    var name: String?
    var abilities: [Ability] = []
    var baseExperience: Int?
    var forms: Name?
    var height: Int?
    var sprites: Sprites?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        id              <-   map["id"]
        name            <-   map["name"]
        abilities       <-   map["abilities"]
        baseExperience  <-   map["base_experience"]
        forms           <-   map["forms"]
        height          <-   map["height"]
        sprites         <-   map["sprites"]
    }
    
    func getAbilitiesDescription() -> String {
        var abilitiesStr = "Abilities: "
        for ability in abilities.enumerated() {
            if let abilityName = ability.element.ability?.name {
                abilitiesStr += abilityName + (ability.offset == abilities.count - 1 ? "." : ", ")
            }
        }
        return abilitiesStr
    }
    
}

struct Sprites: Mappable {
    
    var frontDefault: String?
    var backDefault: String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        frontDefault    <-   map["front_default"]
        backDefault     <-   map["back_default"]
    }
    
    func getUrlForDefaultImage() -> URL? {
        return frontDefault != nil ? URL(string: frontDefault!) : nil
    }
    
    func getUrlForBackImage() -> URL? {
        return backDefault != nil ? URL(string: backDefault!) : nil
    }
    
}
