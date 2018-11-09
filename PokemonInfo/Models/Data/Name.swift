//
//  Name.swift
//  PokemonInfo
//
//  Created by yura on 11/7/18.
//  Copyright © 2018 TFM. All rights reserved.
//

import ObjectMapper

struct Name: Mappable {
    
    var name: String?
    var url: String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        name   <-   map["name"]
        url    <-   map["url"]
    }
    
}
