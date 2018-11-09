//
//  Response.swift
//  PokemonInfo
//
//  Created by yura on 11/6/18.
//  Copyright © 2018 TFM. All rights reserved.
//

import Foundation

public enum Response {
    
    case data(_: Any)
    case error(_: Int?, _: Error?)
    
    init(_ response: (r: HTTPURLResponse?, data: Any?, error: Error?)) {
        
        guard response.r?.statusCode == 200, response.error == nil else {
            self = .error(response.r?.statusCode, response.error)
            return
        }
        
        guard let d = response.data else {
            self = .error(response.r?.statusCode, response.error)
            return
        }
        
        self = .data(d)
    }
    
}
