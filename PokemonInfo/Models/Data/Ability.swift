//
//  Ability.swift
//  PokemonInfo
//
//  Created by yura on 11/8/18.
//  Copyright © 2018 TFM. All rights reserved.
//

import ObjectMapper

class Ability: Mappable {
    
    var ability: Name?
    var isHidden: Bool?
    var slot: Int?
    var abilityDetail: AbilityDetail?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        ability   <-   map["ability"]
        isHidden  <-   map["is_hidden"]
        slot      <-   map["slot"]
    }
    
    func loadAbilitiesDetail(handler: @escaping (Bool) -> Void) {
        if abilityDetail == nil && ability?.url != nil {
            NetworkTask<AbilityDetail>(request: SimpleRequest(url: ability!.url!)).execute { [weak self](response) in
                switch response {
                case .data(let data):
                    self?.abilityDetail = data as? AbilityDetail
                    handler(true)
                case .error(_, _):
                    handler(false)
                }
            }
        } else if abilityDetail != nil {
            handler(true)
        } else {
            handler(false)
        }
    }
    
}
