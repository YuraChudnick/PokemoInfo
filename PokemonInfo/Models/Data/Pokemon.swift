//
//  Pokemon.swift
//  PokemonInfo
//
//  Created by yura on 11/7/18.
//  Copyright © 2018 TFM. All rights reserved.
//

import ObjectMapper

class Pokemon: Mappable {
    
    var name: String?
    var url: String?
    var abilities: PokemonAbilities?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        name   <-   map["name"]
        url    <-   map["url"]
    }
    
    func loadAbilities(handler: @escaping (Bool) -> Void) {
        if abilities == nil && name != nil {
            NetworkTask<PokemonAbilities>(request: PokemonRequest.pokemon(id: name!)).execute { [weak self] (response) in
                switch response {
                case .data(let data):
                    self?.abilities = data as? PokemonAbilities
                    handler(true)
                case .error(_, _):
                    handler(false)
                }
            }
        } else if abilities != nil {
            handler(true)
        } else {
            handler(false)
        }
    }
    
}


